Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9CBAE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 13:48:21 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp1.fc.hp.com [15.15.136.127])
	by atlrel9.hp.com (Postfix) with ESMTP id C0EB0E008BA
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 15:48:20 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 79A84381B0
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 13:48:20 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by ldl.fc.hp.com (Postfix) with ESMTP id 58D5F40A3
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 13:48:20 -0600 (MDT)
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD-ROM audio output 
In-Reply-To: Message from John Marvin <jsm@udlkern.fc.hp.com>
   of "Mon, 19 Aug 2002 04:09:48 MDT." <200208191009.EAA02771@udlkern.fc.hp.com>
References: <200208191009.EAA02771@udlkern.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 19 Aug 2002 13:48:19 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020819194819.B74C337D68@carmen.fc.hp.com>
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

John Marvin writes...

> > > I want to install a CD-Drive in my 715/100. Is it possible to use the
> > > internal audio output of the CD-ROM in the same way it used in a PC?
> > > Which type of cable do I have to use?
> >
> > The problem is where to connect it. There's no way to plug it in to the
> > built-in audio.
> 
> That is incorrect. Most, if not all parisc workstations with CD quality
> audio have an internal connector for CD audio input. However, it is just
> another buffered input to the line input, i.e. you can not separately
> control the CD audio level and the line input level, since they are
> essentially wired together to the same input on the CS4216 codec.

I stand corrected. Do you know if systems ever shipped with the CDROM 
connected to that input?

-- 
Matt Taggart
taggart@fc.hp.com
