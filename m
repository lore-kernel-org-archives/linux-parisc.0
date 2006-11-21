From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Debian etch rc1 & daily build install fail on C160
Date: Tue, 21 Nov 2006 13:48:20 -0600
Message-ID: <200611211348.20682.mszick@morethan.org>
References: <4562C898.2090605@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4562C898.2090605@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue November 21 2006 03:36, Kurt Fitzner wrote:
> I've tried installing Debian Etch rc1 and yesterday's daily build on my
> C160, and both fail.  The installation itself seems to work fine, but
> when it boots after, it can't find the root partition.
> 
> I don't know if it's because the kernel doesn't have the SCSI driver I
> need, or if I'm running into the issue listed on the errata:
> 
> Disk devices may change on reboot
>   On systems with multiple diskcontrollers, the kernel/udev may assign
>   a different device node on reboot of the system than was used during
>   installation due to difference in load order of drivers.
>   This can lead to failure to boot the system. In most cases this can be
>   rectified changing the bootloader configuration and /etc/fstab,
>   possibly using the rescue mode of the installer.
> 
>   Note however that this problem may occur again on subsequent boots.
>   Fixing this issue has priority for the next release of Debian
>   installer.
>

The "etch" system is setup to handle discovery order for cd's and
network interfaces while keeping device names the same.  

The scsi rules are not set up to stabilize the assignments in a similar 
manner, but should be easy to fix.

Look in /etc/udev/ and /etc/udev/rules.d 

- tweak /etc/udev/persistent.rules
to work the same as the pair: /etc/udev/persistent-net-generator.rules
and /etc/udev/rules.d/z25_persistent-net.rules

I.E: Turn /etc/udev/persistent.rules into a "generator" of
/etc/udev/rules.d/z20_persistent_scsi.rules
and
rename the /etc/udev/rules.d/z20_persistent.rules link into
/etc/udev/rules.d/z23_persistent.rules so that it will be
run if the corresponding "generator" has not been run.

Contact me off-list if you have trouble with this local solution.

> Is this something I should be reporting here, or to Debian?

The above is a "local" solution - not approved by Debian.
I am not guessing here if their solution will be the same or not.

Mike
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
