Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E0C7A4841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 04:38:17 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pppd on 2.4.22-pa13
Date: Fri, 7 Nov 2003 12:38:03 +0100
Cc: Nicolas JULIEN <gronico@gronico.org>
References: <1068198742.3302.17.camel@athena>
In-Reply-To: <1068198742.3302.17.camel@athena>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200311071238.03665.deller@gmx.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Applied to kernel 2.4.22-pa14.

Thanks!


On Friday 07 November 2003 10:52, Nicolas JULIEN wrote:
> Hi,
>
> I was having some problems with pppd:
>
> Nov  6 10:13:03 tomawak kernel: sys32_ioctl: Unknown cmd fd(7)
> cmd(40047437) arg(00081cf0)
>
> and I was unable to launch an adsl session.
>
> I've found a solution and I've patched my kernel with:
>
> *** arch/parisc/kernel/ioctl32.c.old    Thu Nov  6 10:18:21 2003
> --- arch/parisc/kernel/ioctl32.c        Thu Nov  6 10:18:52 2003
> ***************
> *** 3176,3181 ****
> --- 3176,3182 ----
>   COMPATIBLE_IOCTL(PPPIOCCONNECT)
>   COMPATIBLE_IOCTL(PPPIOCDISCONN)
>   COMPATIBLE_IOCTL(PPPIOCATTCHAN)
> + COMPATIBLE_IOCTL(PPPIOCGCHAN)
>   /* PPPOX */
>   COMPATIBLE_IOCTL(PPPOEIOCSFWD);
>   COMPATIBLE_IOCTL(PPPOEIOCDFWD);
>
> Maybe it will be usefull to apply this to sources?
>
> Best regards,
>
> Nicolas JULIEN.
