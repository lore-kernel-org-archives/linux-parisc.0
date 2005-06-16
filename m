From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Problems in getting X-Windows to run on HP
	Visualize 785/B2000 with rebuilt 2.6.12-rc6-pa1 kernel and
	Matrox Millennum II
Date: Thu, 16 Jun 2005 19:10:08 +0100
Message-ID: <e6eae02905061611107395fd51__39764.5217519768$1416623803$gmane$org@mail.gmail.com>
References: <5.1.1.6.1.20050616141324.02a2d920@pop.singnet.com.sg>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050616141324.02a2d920@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/16/05, J. L. Lee <jllee@singnet.com.sg> wrote:
> Hi,
>
> Yesterday I reported that I have set up successfully a Matrox Millennum I=
I
> PCI video card on an HPPA RISC B2000 workstation and was able to connect =
an
> HP910 to the Matrox Millennum video port running it as a text console.
>
> I tried today to install and configure X Windows and am encountering
> problems. I installed, upgraded and configured the X Windows package (not
> by selecting Debian Software selection's "Desktop Environment" selection
> but selecting X Windows package using Aptitute from the "Manual Selection=
"
> in the same menu).
>
> I configured X according to the hardware I have and made sure it would bo=
ot
> up on Init State 2 and rebooted the B2000 with the Matrox Millennum II ca=
rd
> inside. It hung after displayed the login prompt and followed almost
> immediately by "Backtrace:" (with no more output)!

I guess the kernel crash results when xdm/XFree86 is being started.
That is what it usually looks like on my machine when I select the wrong
X11 driver.

> I then removed the Matrox Millennum II card and rebooted again. It was
> successful this time with the same configuration files!
>
> Any suggestion on where I should "shoot" next (next actions)?

Perhaps you are not using the fbdev driver for XFree86;
using the mga (=3Dnative) driver in /etc/X11/XF86Config-4 will crash
the machine (HPMC) when it tries to start X.

 Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
