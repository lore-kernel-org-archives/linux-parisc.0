Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA00434
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Aug 2000 19:57:31 -0600
Message-Id: <200008091852.LAA04581@milano.cup.hp.com>
To: schaecsn <schaecsn@gmx.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: PA/Linux CD Image 
In-reply-to: Your message of "Wed, 09 Aug 2000 17:45:27 PDT."
             <39917C97.4DC81F31@gmx.de>
Date: Wed, 09 Aug 2000 11:52:02 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

schaecsn wrote:
> Hello,
> 
> I am interested in trying out the PA Linux cdrom. Before I put much
> effort into installing it on my 735 i have a few questions.

The CD targets the 712/715/A180/B180 -like machines.
Check the HWDB to see what devices in the 735 are supported.

> my understanding of the current state of the port is that the kernel
> boots and some user applications run at ... at least a few seconds.
> right?

Yes. I was even able to dd from one disk to another w/o crashing. :^)

> how "complete" is the cdrom image, e.g. does there exist a /etc
> directory with some rc.d files and similiar essential things?

Yes. It gets to a login prompt and is multitasking.
I believe the CD-image at:

  ftp://puffin.external.hp.com/pub/parisc/cd-images/palinux-0.1-noftp.raw.gz

is basically the same bits as in:

  ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20000804.tgz

I've placed the "tar tzvf" output of nfsroot-20000804 in
.../nfsroot-20000804.contents.

BTW, kudos to Paul Bame and Matt Taggart for putting these images together.
(I'm not ignoring previous and other contributors - just want to
give credit for this particular one)

> if i put
> some effort into installing it then I'll like to use it as a basis for
> further updates, e.g. when there will be eventually a stable kernel I
> want to install it over this distribution.

I think the goal is to completely clobber this once shared libs are
useable...the image sizes will be much smaller then too.

It's pretty easy to install....took me < 30 minutes, including
writing up feedback on the alpha version of the README.INSTALL.

Read the "WARNINGS" several times and heed them.  If you don't
know what you are doing, parisc-linux isn't ready for you yet.
You are welcome to learn by trying but don't be to surprised
by the results...

> I'll have to install probably
> some further programs, too. Will this be possible with a "reasonable"
> effort?

Networking userspace wasn't clearly working last I tried.
You can xenv build the apps and then mount the parisc-linux disk on a
x86-linux. Not sure that fits your definition of "reasonable" but it's
do-able.

> aehm, i have a 200MB SCSI disk. That is enough, isn't it?

I think so:
grundler <514>du -s lwe.nfsroot/
102924  lwe.nfsroot

I transferred that to a disk which has 10MB boot and 64MB swap partitions.
So 200MB should work (for now :^)).

FWIW, I have debian linux installed on my OB600 which only
has a 340MB disk. basic install (ie had networking and some
core X11 bits installed) left me with ~150MB or so free. But
for it to be useful to me, I had to install tools/source/etc
and now am down to ~20MB free.

But given that HP is scrapping older 525MB and 1GB SE SCSI disks, I
think you should be able to find something bigger for < $20 on
e-bay or at your favorite computer recycling center.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
