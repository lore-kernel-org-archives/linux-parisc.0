Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 047934841
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 10:05:08 -0700 (MST)
Date: Fri, 21 Feb 2003 18:05:03 +0100
Message-ID: <3E484410000030D7@ocpmta7.freegates.net>
In-Reply-To: <3E484410000030B6@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] X problems...
To: "Dan Baker" <dan_baker@eli.net>,
	"'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

just find this dated Jan 2003 for 2.4 kernel I presume:

<ftp://ftp.msclinux.com/msclinux/i686/current/SRPMS/hpgraphics-1.5.3.2.4.18-9.msc.src.rpm>

seems also containing tools (will see later)

hth,
    Joel

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>Subject: RE: [parisc-linux] X problems...
>To: "Dan Baker" <dan_baker@eli.net>,
>	"'Grant Grundler'" <grundler@dsl2.external.hp.com>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Fri, 21 Feb 2003 17:17:49 +0100
>
>
>Hi Dan,
>
>I also install a b2k with linux, also I am very interrested by your information.
>
>I so download rpms that you mentionned and install it.
>
>I just first notice that they are just different revision of the kernel
>module for hpgfx :). But, after a quick search on google, I read that it
>must exists somewhere a set of user space tools as FXconfig.sh (to config
>XFree86 if I well understand). Any info about this?
>
>Some other notes:
>using rpm to install sources I read in SPEC file:
>_Distribution_: Red Hat Linux 6.2 (2.2.16-3)
>                                   ^^^^^^^^
>ok that is just a text but it makes me feel that it would run on 2.2 kernel
>only
>In your knowledge, is there some more recent release supporting 2.4?
>
>And finaly (the very bad news) I think that I found the answer to your original
>question (gcc complaints about unknown code IIRC):
>_BuildArchitectures_: i386
>
>And effectively a quick 'find' in sources makes me appear that there are
>unfortunaltely asm code (specific to i386 arch :( )
>
>So finaly I am interrested to know how do you build your module:
>for me a simple make failled because it did not know where to find some
>headers,
>and rpm -bb SPECS/tag... failled because of architecture restriction?
>
>Sorry to not be more helpfull,
>    Joel
>
>
>
>>-- Original Message --
>>From: "Dan Baker" <dan_baker@eli.net>
>>To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
>>Cc: <parisc-linux@lists.parisc-linux.org>
>>Subject: RE: [parisc-linux] X problems...
>>Date: Thu, 20 Feb 2003 09:28:04 -0800
>>
>>
>>the other driver is at
>>ftp://ftp.hp.com/pub/ccd/soar2sdd/wk259/wk259mu/hpgraphics_kernel-1.5.13-1.s
>>rc.rpm
>>
>>Sorry
>>
>>Dan Baker
>>
>>-----Original Message-----
>>From: parisc-linux-admin@lists.parisc-linux.org
>>[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Grant
>>Grundler
>>Sent: Wednesday, February 19, 2003 9:15 PM
>>To: Dan Baker
>>Cc: parisc-linux@lists.parisc-linux.org
>>Subject: Re: [parisc-linux] X problems...
>>
>>
>>On Wed, Feb 19, 2003 at 05:42:29PM -0800, Dan Baker wrote:
>>> BUT, I did download source code for HP's Intel linux visualize driver.
>>I
>>> can't get it to compile, the assembler tells me there's an invalid opcode
>>> (??) in the .o file. I'm not really a programmer, so I'm hoping somebody
>>out
>>> there can take a look at what they're doing and fix it.
>>
>>Well, it's not that easy even for someone who can read C.
>>
>>First, some bad news:
>>o x86 version of the card has extra VGA cruft+BIOS.
>>  PA-Risc version uses STI firmware for initialization.
>>o IIRC, the X11 server (or maybe just gfx card driver?) is a custom,
>>  closed source code.  Hopefully I'm wrong and someone will correct me.
>>o I'll guess that many (most of the?) interesting bits are in the XF86
>>  hpgfx driver module. I'm assuming one exists.
>>
>>Good news: 3d acceleration for x86 cards uses the same RISC engines
>>as the parisc cards.
>>
>>Several years ago I asked someone in the HP gfx group if they
>>could port the HPUX driver to parisc-linux but our port wasn't
>>ready then (I think it is now). The gfx driver interacts *alot*
>>with the rest of the kernel *and* the X11 server.
>>The above is what I remember from conversations with people.
>>
>>> The files are at
>>>
>>>
>>ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
>>> c.rpm
>>> and
>>>
>>ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
>>> c.rpm
>>
>>uhm...'cuse me, but aren't those the same?
>>
>>hth
>>grant
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>
>---------------------------------
>Vous surfez avec une ligne classique ?
>Faites des economies avec Tiscali Complete
>... Plus d'info sur http://complete.tiscali.be
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
