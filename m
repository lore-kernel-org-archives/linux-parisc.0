Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D56D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 04:09:52 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 68887805104
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 06:09:48 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id EAA02771
	for parisc-linux@lists.parisc-linux.org; Mon, 19 Aug 2002 04:09:48 -0600 (MDT)
Date: Mon, 19 Aug 2002 04:09:48 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200208191009.EAA02771@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CD-ROM audio output
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

> > I want to install a CD-Drive in my 715/100. Is it possible to use the
> > internal audio output of the CD-ROM in the same way it used in a PC?
> > Which type of cable do I have to use?
>
> The problem is where to connect it. There's no way to plug it in to the
> built-in audio.

That is incorrect. Most, if not all parisc workstations with CD quality
audio have an internal connector for CD audio input. However, it is just
another buffered input to the line input, i.e. you can not separately
control the CD audio level and the line input level, since they are
essentially wired together to the same input on the CS4216 codec. The
exception is the newer workstations that use the AD1819 codec. That has
a separate CD audio input, and the CD input connector is wired to that,
rather than the line input. Of course, we don't have a driver for the
AD1819 yet.

The connector that was described in this discussion with regard to the 715
is indeed the CD audio input.

John Marvin
jsm@fc.hp.com
