Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DCAA4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 16:28:44 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel8.hp.com (Postfix) with ESMTP id C04CEA0008B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 18:28:39 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id QAA23496
	for parisc-linux@lists.parisc-linux.org; Thu, 29 Aug 2002 16:28:39 -0600 (MDT)
Date: Thu, 29 Aug 2002 16:28:39 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200208292228.QAA23496@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

(Message inbox:75808)
Date:    Thu, 29 Aug 2002 20:22:23 +0200
To:      Ryan Bradetich <rbradetich@uswest.net>,
	 parisc-linux@lists.parisc-linux.org
Reply-To: christian@familieschmitt.de
Return-Path: parisc-linux-admin@lists.parisc-linux.org Thu
>From:    Christian Schmitt <chris.81@gmx.de>
Subject: Re: [parisc-linux] Harmony on 710 working?

Oops, I guess I missed that the model in question was a 710. 710's don't
have harmony audio. 705's & 710's have a different codec (Siemens PSB
2160) that is only capable of "telephone quality" audio, i.e. mono, fixed
8 Khz sampling rate.  There is currently no driver for this hardware.

FYI, The 720, 725, 730, 735, 750 & 755 don't have any kind of audio (although
there is a graphics card with onboard CD quality audio that was made for the
715s and 715t models that can also be put into these machines).

The 705, & 710 have the Siemens codec. The 715 is the first model with
"CD" quality audio.

John Marvin
jsm@fc.hp.com
