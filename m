Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with ioctl and 64bits 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 11 Jun 2002 13:40:49 +0200." <3D05E1C1.DF69D5B@admin.france.hp.com>
References: <3D04BD42.446D930@admin.france.hp.com> <20020610152428.GB5876@tausq.org> <3D059013.9272EEEA@admin.france.hp.com>  <3D05E1C1.DF69D5B@admin.france.hp.com> 
Date: Tue, 11 Jun 2002 15:47:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020611214710.1330F4856@dsl2.external.hp.com>
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
> 	Haaaaa, I've succeded at the end. Now ioctls are working fine.

Excellent!

> Sorry, I beg your pardon, the probleme was coming from the manner I
> declare my ioctls cmds. With 64bits kernel it is:
> #define DIOSDUMPDEV32             _IOW('p',0xa0,unsigned int) 
> And in user space it is (32 bits):
> #define DIOSDUMPDEV32             _IOW('p',0xa0,unsigned long)

shouldn't both kernel and user space use the same definition?
(ie unsigned int)
If they don't, I expect the ioctl wrapper to do some work.

grant
