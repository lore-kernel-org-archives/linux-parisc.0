From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] stifb crash on 64bit kernel
Date: Mon, 16 Jan 2006 20:38:56 +0100
Message-ID: <200601162038.56418.deller@gmx.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QZ/yD/OS7HmHBKu"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_QZ/yD/OS7HmHBKu
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I just tried the STI framebuffer driver (stifb) again with a 64bit kernel.
As we know it crashes, but I was wondering, why it crashes.
Aparently the mmap() implementation in fbmem.c [fb_mmap()] doesn't works correctly in 64bit mode.
The attached example program is a test-case to produce the crash. 
Just running it, will immediately crash the kernel while it tries to write into the mmapped area.

PCI_BUS_ADDR() and lmmio_space_offset in include/asm-parisc/pci.h looks interesting in this regard.
My 64bit box is the only one, where the graphics card is connected via PCI, and due to the F_EXTEND() macro we expand the physical address into the 0xffffffff00000000UL area.
Might it be, that we need to mmap() another region - maybe calculated with help of PCI_BUS_ADDR() - in the fb_mmap() function in order to make the 64bit graphics working on hppa ?

Any ideas ?

Helge

--Boundary-00=_QZ/yD/OS7HmHBKu
Content-Type: text/plain;
  charset="us-ascii";
  name="stifb_crash.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="stifb_crash.c"

#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <sys/mman.h>

/* taken from: http://www.sm5sxl.net/~mats/src/unix/graphics/fbtest/framebuffer.html */

int main()
{
        int fbfd = 0;
        struct fb_var_screeninfo vinfo;
        struct fb_fix_screeninfo finfo;
        long int screensize = 0;
        char *fbp = 0;
        int x = 0, y = 0;
        long int location = 0;

        /* Open the file for reading and writing */
        fbfd = open("/dev/fb0", O_RDWR);
        if (!fbfd) {
                printf("Error: cannot open framebuffer device.\n");
                exit(1);
        }
        printf("The framebuffer device was opened successfully.\n");

        /* Get fixed screen information */
        if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo)) {
                printf("Error reading fixed information.\n");
                exit(2);
        }

        /* Get variable screen information */
        if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo)) {
                printf("Error reading variable information.\n");
                exit(3);
        }

        /* Figure out the size of the screen in bytes */
        screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;

        /* Map the device to memory */
        fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED,
                fbfd, 0);
        if ((int)fbp == -1) { printf("Error: failed to map framebuffer device to memory.\n"); exit(4);
        }
        printf("The framebuffer device was mapped to memory successfully.\n");

        x = 100; y = 0;       /* Where we are going to put the pixel */

        /* Figure out where in memory to put the pixel */
        location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
                (y+vinfo.yoffset) * finfo.line_length;

/* the following lines will crash the 64bit kernel */
/* if commented out, no crash will happen */
#if 1
        *(fbp + location) = 100;        /* Some blue */
        *(fbp + location + 1) = 15;     /* A little green */
        *(fbp + location + 2) = 200;    /* A lot of red */
        *(fbp + location + 3) = 0;      /* No transparency */
#endif

        munmap(fbp, screensize);
        close(fbfd);
        return 0;
}

--Boundary-00=_QZ/yD/OS7HmHBKu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_QZ/yD/OS7HmHBKu--
