Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B52C482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 17:58:20 -0600 (MDT)
Message-Id: <m172hUx-000KUzC@phantom.home>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
In-Reply-To: Your message of "Tue, 30 Apr 2002 17:58:59 +1200."
             <002a01c1f00c$1f288eb0$5e01000a@bongo>
References: <002a01c1f00c$1f288eb0$5e01000a@bongo> 
Date: Tue, 30 Apr 2002 17:57:31 -0600
From: Paul Bame <bame@riverrock.org>
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

> I also had a look in arch/parisc/kernel/ioctl32.c and there were a
> couple of lines commented out with comments like "new RAID code is
> half merged". Is RAID on 64-bit PA-RISC a work in progress?

Yeah, if you're doing it :->  If you'd like to post a patch for
translating those ioctl calls that would be great!  I think proper
translation of the relevent ioctls is all that's needed.

	-P
