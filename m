Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sfcn.org (unknown [63.117.233.198])
	by dsl2.external.hp.com (Postfix) with ESMTP id E91204840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 00:30:50 -0700 (MST)
From: Nicholas Leippe <nick@byu.edu>
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Install failure: C240, 3.0r1, 2003.09.24 and 2003.10.22 net inst isos
Date: Wed, 26 Nov 2003 00:30:37 -0700
References: <200310271933.00659.nick@byu.edu> <20031028045531.GA21288@colo.lackof.org>
In-Reply-To: <20031028045531.GA21288@colo.lackof.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200311260030.37916.nick@byu.edu>
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

On Monday 27 October 2003 09:55 pm, Grant Grundler wrote:
> Nicholas,
> thanks for the bug report.
> Please see http://www.parisc-linux.org/faq/kernelbug-howto.html
>
> more questions/comments below.
>
> On Mon, Oct 27, 2003 at 08:33:00PM -0600, Nicholas Leippe wrote:
> > Hello all,
> >
> > I just got my new C240 set up and attempted to install.  With either
> > of
> >
> > palinux-2.4.22-pa9-20030924-netinst.iso
> > palinux-2.4.22-pa13-20031022-netinst.iso
> >
> > it boots into the debian installer and then promptly hangs at the
> > 'select language' menu.

Okay, I haven't spent the time yet to get any detailed info on these 
failures, but I thought I'd at least report the behavior I've observed so 
far.  With graphical install on any of:

3.0r1
palinux-2.4.22-pa9-20030924-netinst.iso
palinux-2.4.22-pa13-20031022-netinst.iso

I get various, repeatable failures before getting to or past the first 
menu.  However, I can complete a successful install from serial console 
with at least two of them.  However, once installed and rebooted, if I 
attempt to install additional packages, after a while the machine will 
freeze solid while apt is trying to do it's thing.

With the latest:

palinux-2.4.22-pa17-20031119-netinst.iso

During graphical install, it successfully gets through the menus, but once 
it starts the package installation cp get's stuck in the D state.  I can 
alt-f2 or whatever to another vc and use top to see-but the installer is 
thoroughly hung.

Just last weekend, I successfully installed hpux 10.20 from cd with no 
hiccups whatsoever, and it still runs like a peach.  So, I'm leaning even 
further away from suspecting a hardware fault.

My machine is:
C240
1.5GB ram (edo)
4.5GB UW hdd (Seag. ST34572W)
CDROM (Tosh. XM5701-B)
fdd
A4450A (eg) video

Probably irrelevant details, but ya never know.  Perhaps an issue with 
HIMEM since it's >1GB ?

>
> See "Hung Kernels" section in the FAQ.
>
> Did you try to install with serial console or graphics console?
> With serial console, it's easier to capture the output.
> And it's possible this bug only affects graphical console.
>
> >   I dug around the archives and found an email about this
> > from several years ago, but no resolution was posted.
>
> URL for mail you found?

Sorry, can't remember what it was now.

>
> > So I dug out my 3.0r1 cd to try but got an HPMC a little ways into
> > the kernel boot.  I know the 3.0r1 cd is good, since I successfully
> > installed a C180 with it (besides checking the md5s, which I also did
> > for the netinst isos).

...

> >
> > Any ideas?  Need more info?--just tell me what and how to get it.
>
> "in io" output from the boot console handler would also be good.
>

I'll dig into this a bit more when I get time.  If any of these details 
help narrow it down any, let me know what details to go for first.  
Otherwise I'll see if I can grab some details from the serial console 
&etc. as requested before in the first reply.


Nick
