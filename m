Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] start physical address for 712/100 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Wed, 23 Jan 2002 10:36:47 +0100." <3C4E842F.3D36290F@admin.france.hp.com>
References: <3C4E842F.3D36290F@admin.france.hp.com> 
Date: Thu, 24 Jan 2002 23:22:05 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020125062205.0BFAF482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> 	Hi
> I start to look a bit more deeply in the dump
> I'm creating. And I found that the physical
> memory start at address 0x0000000010000000.
> Is it normal ? Or do I missed something ?

Uhm...I don't think thats right. All parisc boxes have
physical memory that's zero based. You should be able
to verify this with any HPUX crash dump.

Post where you are getting the data from and perhaps
we can help correct it.

> btw I've added the dump option "s", and by
> default it is /boot/vmlinux. So when palo will
> be able to give us the option, we will have the
> true kernel path directly in the dump header.

That's reasonable - don't forget to query or tell the user
where the vmlinux belongs in case it's not available.

grant
