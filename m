From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 9 Nov 2010 22:35:28 -0500
Message-ID: <20101110033527.GA24762@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 07 Nov 2010, John David Anglin wrote:

> > In short, I'm skeptical this is a problem in lba_pci code.
> > Much more likely to be a driver issue or possibly HW issue.
> > I was pointing at the configs that booted on ion/ioz only to
> > help rule out driver or HW issues. Feel free to use ion for
> > testing this.
> 
> I agree.  I think the hpmc in the lba_pci code and the hpmc with
> LBA debug messages enabled are likely related.  Do you have any idea
> how the code could avoid shooting itself in the foot?
> 
> Do you think there is a SMP race in setting up the PCI bus.  I was
> thinking of trying an identical UP build.  I believe that all processors
> are enabled at the time the hpmc occurs.

UP kernels behaive differently.  Boot is hpmc'ing in handle_unaligned.
The kernel dies in this block of code:

00000000401218f4 <.L3^B18>:
    401218f4:   e8 1f 11 35     b,l 40121194 <.L3^B2+0x20>,r0
    401218f8:   db 85 0f e0     extrd,s ret0,63,32,r5
    401218fc:   9f fc 20 10     cmpb,*= ret0,r31,4012190c <.L3^B18+0x18>
    40121900:   36 7c 22 00     ldo 1100(r19),ret0
    40121904:   bf fc 31 15     cmpb,*<> ret0,r31,40121194 <.L3^B2+0x20>
    40121908:   34 05 3f ff     ldi -1,r5
    4012190c:   34 16 00 00     ldi 0,r22
    40121910:   50 d5 05 40     ldd 2a0(r6),r21
    40121914:   50 df 05 30     ldd 298(r6),r31
    40121918:   db 57 0b fb     extrd,u r26,63,5,r23
    4012191c:   f2 75 00 7d     depd,z r21,60,3,r19
    40121920:   00 1f 58 20     mtsp r31,sr1
    40121924:   f2 a0 04 1d     depd r0,63,3,r21
->  40121928:   0e a0 50 d6     ldd 0(sr1,r21),r22
    4012192c:   0e b0 50 d4     ldd 8(sr1,r21),r20
    40121930:   96 73 00 80     subi 40,r19,r19
    40121934:   01 73 18 40     mtsar r19
    40121938:   d2 96 02 16     shrpd r22,r20,sar,r22
    4012193c:   08 00 02 5c     copy r0,ret0

sr1 is 0 and r21 is 00000000c0000008, so I think we have an unaligned
kernel load.  Not sure where it is coming from.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
