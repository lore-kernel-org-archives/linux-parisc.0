Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout11.sul.t-online.com (mailout11.sul.t-online.com [194.25.134.85])
	by dsl2.external.hp.com (Postfix) with ESMTP id E571E4845
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Aug 2002 14:23:48 -0600 (MDT)
Date: Wed, 28 Aug 2002 22:20:15 +0200 (CEST)
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
To: <christian@familieschmitt.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Harmony on 710 working?
In-Reply-To: <3D6CDF5A.5090205@gmx.de>
Message-ID: <Pine.LNX.4.33.0208282215040.28537-100000@marvin.forty.two>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Christian,
at least I got the Harmony driver working on my c110. I used the Kernel
driver first, but found out that kmixer wasn't working (obviously expected
alsa)
I could however cat *.au files to /dev/audio making a lot of sound. After
that, I compiled the alsa stuff -there are two sets of drivers, but one
didn't work as expected. I cannot look things up, currently I am on
holliday in Ireland.. You need to insmod the driver as far as I remember.
I'll be able to tell you more after the linux beer hike... ;-)

cheers

Juergen


===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\

On Wed, 28 Aug 2002, Christian Schmitt wrote:

> Hi,
>
> I recently downloaded and compiled the latest pa-kernel. I also included harmony
> sound support and now I would like to know if and how I can access the sound
> device. Serching on the web was no success.
>
> Chris
>
> --
> Linux - Cause life is too short for reboots
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
