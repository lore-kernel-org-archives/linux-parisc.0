Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6758E4884
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 08:56:11 -0600 (MDT)
Received: from esiee.fr (pc5158b.esiee.fr [147.215.50.168])
	by mail.esiee.fr (Postfix) with ESMTP id 8391949C81
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 16:56:04 +0200 (CEST)
Message-ID: <3D133E84.9060100@esiee.fr>
Date: Fri, 21 Jun 2002 16:56:04 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 0.9.3 Audio on C110
References: <HMEKIKEAKEFFMJJOEAJNIELOFIAA.maudette@synopsys.com> <20020621143955.GB1385@tykepenguin.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

Patrick Caulfield wrote:

>[...]
>Works fine for me: only playback though - no recording :(
>
>monk:~# ls -l /dev/dsp
>crw-rw----    1 root     audio     14,   3 Nov 15  2001 /dev/dsp
>
>The driver is called "harmony" - I have mine hard compiled into the kernel.
>
>patrick
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
Does anybody knows if it is specific to C110/C100 (Raven) or is it the 
case for others?
Personnaly, I have recording support on my B132 and 712.

Matthieu Delahaye
