Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D1A84829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 09:46:24 -0600 (MDT)
Date: Wed, 16 Apr 2003 17:46:15 +0200
Message-ID: <3E9BA3A600000D8F@ocpmta2.freegates.net>
In-Reply-To: <Pine.LNX.4.44.0304161319540.28370-100000@sal.ucc.ie>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] STI fb questions
To: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
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

>So it should be able to display at least 800x600 in 24/32bit and
>1024x768 in 16bit, but it refuses to do so. 'dmesg' ALWAYS shows
>only 8bit colour depth regardless of the display resolution.
>

(may be you will find more accurate explanation on the stifb driver limits
with a search in this m-l)

>Obviously the standard sti=8/24 sti_font=VGA8x16 is used in the
>kernel command line (according to dmesg, however it's not specified in
>palo.conf).

Well if some parameters are not specified, palo take default value for those
once. 

>
>My question is know, does STIfb also supports 16bit? How can I force
>16bit and 24/32bit colour depths?

Unfortunately, it is not possible to force to use more than what dmesg announce
you (see limits) :(

> What does sti=8/24 exactly mean?
>
IIRC 8bit 24 colour depth.

Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
