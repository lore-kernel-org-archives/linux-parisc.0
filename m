Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81D0D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 03:07:21 -0600 (MDT)
Date: Wed, 4 Sep 2002 11:00:27 +0200
Message-ID: <3D3815BD0000B51A@ocpmta5.be.tiscali.com>
In-Reply-To: <20020903161326.GI14634@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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


>> But where is iaoq (I do not found in linux/Documentation/parisc)?
>> 
>> here is what I got: grep 101080 /boot/System.map-2.4.19-pa9
>> 10108000 T syscall_exit_rfi
>> 10108064 t intr_return
>> 10108078 t intr_check_resched
>> 10108084 t intr_check_sig
>> 10108090 t intr_restore
>
>is this the system.map from the kernel you are building?
>if it is, then intr_return is the calling function (one up in the
>stack). the function that includes 1010863c is the one that one that's
>causing the fault. that would be one place to look.
>

Hmm the only entry I found concerning intr_return are content into entry.S.

Sorry for the moment I have not enough time to learn parisc asm, how is it
implemented with gcc and how to interface with C, ...

Thanks anyway for all help,
    Joel


Big Brother Anders  - With Tiscali you will see it all !  Check it up on
 www.tiscali.be/bigbrother
