Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C22D487C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 08:39:57 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17LPZr-0000rW-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 15:39:55 +0100
Date: Fri, 21 Jun 2002 15:39:55 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.3 Audio on C110
Message-ID: <20020621143955.GB1385@tykepenguin.com>
References: <HMEKIKEAKEFFMJJOEAJNIELOFIAA.maudette@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <HMEKIKEAKEFFMJJOEAJNIELOFIAA.maudette@synopsys.com>
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

On Fri, Jun 21, 2002 at 09:59:06AM -0400, Michael Audette wrote:
> Hello,
> 
> First off I would like to give Kudos to everyone who worked on this project.
> I cant believe the C110 is actually doing something useful again (and I
> don't have to deal with HP's version of POSIX).  I cant believe that
> everything including X and gnome, KDE etc are all working rather flawlessly!
> 
> I do have one problem still.  I am at a loss for the Audio.  It would appear
> by looking back in the threads that the audio is working on this model
> 9000/C110.  But I don't know how to go about getting it working.  Do I need
> to rebuild the kernel?  Is there a module that can be loaded for it?  Or are
> my /dev screwed up for audio/dsp?

Works fine for me: only playback though - no recording :(

monk:~# ls -l /dev/dsp
crw-rw----    1 root     audio     14,   3 Nov 15  2001 /dev/dsp

The driver is called "harmony" - I have mine hard compiled into the kernel.

patrick
