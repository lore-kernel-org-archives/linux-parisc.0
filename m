Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA12086
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 23:25:47 -0600
Date: Wed, 30 Aug 2000 01:25:21 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot. 
In-Reply-To: <20000830030514.75C5637D06@carmen.fc.hp.com>
Message-ID: <Pine.SOL.4.21.0008292333530.24934-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 29 Aug 2000, Matt Taggart wrote:

> 
> Andrew Park writes...
> 
> > I must be missing something...
> > I got a bootable HP-UX installation CD today, so I popped it in my CDROM
> > and on the BOOT_ADMIN> prompt I typed, boot lan isl.  It still gets
> > stuck, then I changed the path, so that cdrom is primary and the LAN is
> > secondary, then typed  boot pri isl, and it comes right back to the
> > BOOT_ADMIN> prompt.  Am I missing something obvious?
> 
> Are you sure that the CDROM is bootable? What type of CDROM drive are you 
> using? I'm not positive that just any drive will work. Can you see the cdrom 
> when you do a "sea scsi"? If not then either the CDROM isn't bootable or the 
> drive isn't working.

The CDROM is a 4 speed NEC.  search at BOOT_ADMIN> prompt returns

	NEC CD-ROM DRIVE:501

so it is finding it.

> Why don't you try to use the uxbootlf that I posted? I know you're having 
> problems with bootp/tftp but you'll need to get them working if you want to 
> use newer kernels.
> 
> In my experience bootp/tftp are a pain for everyone and just require 
> persistance to get working. Send me errors if you can't get it working.

We can narrow it down to tftp.  bootp sees the request and replies to
it, but somehow tftp just doesn't transfer uxbootlf.  But it likes
vmlinux (coming from building palo) in which case it transfers the kernel
and gets stuck only at pdc_cons die !!  This is bizarre...
With uxbootlf, I did a strace on one of the in.tftpd process and got

recv(0, 0x804b380, 516, 0)              = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) ---
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
send(0, "\0\3\0\200\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 516, 0) = 516
alarm(5)                                = 0
recv(0, 0x804b380, 516, 0)              = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) ---
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
send(0, "\0\3\0\200\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 516, 0) = 516
alarm(5)                                = 0
recv(0, 0x804b380, 516, 0)              = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) ---
_exit(1)                                = ?

While the client is trying to download the image, the server always
has four in.tftpd instances.  Older process times out, then a fresh one
comes a board.  Unfortunately, log file doesn't say much, it only
has

	trying to get file: /tftpboot/uxbootlf

which comes from

	int validate_access (char,int)

of tftpd.c.  I put some debugging message to it and verified that
the function did not return an error.
So any ideas now?  With the same set up (with an exception of boot image
file name) vmlinux (resulting image of doing make palo under linux-2.3
directory) pretty much works, but with uxbootlf it doesn't go anywhere
so far - very odd.
Let me know, Thanks.


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
