Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DE384829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 10:10:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17koM7-0006Bi-00; Fri, 30 Aug 2002 17:10:43 +0100
Date: Fri, 30 Aug 2002 17:10:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: Steve Pacenka <spacenka@lightlink.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
Message-ID: <20020830171043.B28676@parcelfarce.linux.theplanet.co.uk>
References: <200208292228.QAA23496@udlkern.fc.hp.com> <1030723367.1100.401.camel@romano>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1030723367.1100.401.camel@romano>; from spacenka@lightlink.com on Fri, Aug 30, 2002 at 12:02:47PM -0400
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

On Fri, Aug 30, 2002 at 12:02:47PM -0400, Steve Pacenka wrote:
> On Thu, 2002-08-29 at 18:28, John Marvin wrote:
>  
> > FYI, The 720, 725, 730, 735, 750 & 755 don't have any kind of audio (although
> > there is a graphics card with onboard CD quality audio that was made for the
> > 715s and 715t models that can also be put into these machines).
> 
> A 735/99 I use has audio sufficient to play mp3's at good sound quality
> using alsaplayer; I assume this is Harmony hardware.  Not part of a
> framebuffer card.

i believe jsm is mistaken about the 735 & 755.  735 used the followon
chip from Asp and would surely have had the same sound abilities as the
715/Scorpio.  the harmony driver should stop claiming the 705/710 audio
though (an easy change to make).

-- 
Revolutions do not require corporate support.
