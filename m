From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] c3k panics
Date: Wed, 1 Jun 2005 16:04:08 +0200
Message-ID: <4282FEEC00007D5D@mail-2-bnl.tiscali.it>
References: <4299F8C2.2060400@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4299F8C2.2060400@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[snip]
> > 
> > The same for me, it seems that the pb appears during 2.6.9 developeme=
nt;
> > as far as I can test, it seems that the pb appears between 2.6.9-rc2-=
pa2
> > and pa5;
> > For my part I already tried to revert only this pa5 (just to be sure)=


> > <http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-Septem=
ber/034576.html>
...
> > 
> > So still have to revert few thing (but it would be hard like fixup 
> > stuff) to try to isolate the pb?
> > 
Well again for the record, I also reverted this (always to be shure that
this is not becuase this new fixup_branch).
but the kernel alway failed the same way i.e.:
>>IASQ: 00000000 00000000 IAOQ: 1014c10c 1014c110
>> IIR: 6b800020    ISR: 00000000  IOR: 84de0906
>> CPU:        0   CR30: 15d98000 CR31: 10450000
>> ORIG_R28: 1039a000
>> IAOQ[0]: alloc_slabmgmt+0x30/0x6c
>> IAOQ[1]: alloc_slabmgmt+0x34/0x6c
>> RP(r2): cache_grow+0xd4/0x1a8
>>Kernel panic - not syncing: Kernel Fault

I also try to re-use compile option: "cflags-y        +=3D -mdisable-fpre=
gs"
but this time the system hang without any panic (nothing in pimfo after t=
he
forced reboot) nor backtrace?
so helpless :-(

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
