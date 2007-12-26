From: rubisher <rubisher@scarlet.be>
Subject: iommu_fill_pdir() and its /* Horrible hack. ... */ reading.
Date: Wed, 26 Dec 2007 17:31:51 +0000
Message-ID: <47729007.8030807@scarlet.be>
References: <476CFFE3.3040102@scarlet.be> <20071223093903.GA30259@colo.lackof.org> <476EE63A.9080807@scarlet.be> <20071224085159.GC15161@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071224085159.GC15161@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Sun, Dec 23, 2007 at 10:50:34PM +0000, rubisher wrote:
> ...
>> btw do you notice how much way are there (in so few lines) to use a 
>> unsigned 32bits integer: u32, __u32 but also uint32_t, u_int32_t, ...
>>
>> Is there some advise om the best pratice?
> 
> IIRC, Preferred is "u32". But use whatever is consistent with the
> file you are editing.
> 
>> Ah also related to ccio-dma patch test on my c110, it seems that removing 
>> DELAYED_RESOURCE_CNT code help a bit this system with few ram (64Mb only) 
>> to survive a bit longer (enough to debootstrap and download 800Mb to be 
>> installed) but that didn't make the drill: there are still fs corruption 
>> from time to time and some reset on the lasi disk ;-(.
>> This test just seems to confirm an issue of i/o coherency somewhere but 
>> where those rules could be broken???
> 
> ISTR Joel Soete reporting problems for CCIO machines as well.
> Offhand, I don't know what's wrong and we depend on Ryan Bradetich
> and other volunteers to track that down. 
> 
> cheers,
> grant
> 
>> Merry Xmas,
>> 	r.
>> -
Hello Grant,

I suspecting a possible issue with this hack in your iommu_fill_pdir():

you initialized dma_sg with the adress of startsg (/* pointer to current DMA */)
then before the loop you dma_sg--;

(where and what dms_sg point to, I guess we have any idea?)

Now in the while (nents-- > 0), suppose the test "if (sg_dma_address(startsg) & PIDE_FLAG) {" failed,

so later in the loop the "sg_dma_len(dma_sg) += startsg->length" (which is actually "dma_sg->iova_length += startsg->length" 
) imo could corrupt something?

That said I tried to re-use the first implementation of jejb (what was in ccio-dma.c before this patch 
<http://cvs.parisc-linux.org/linux-2.6/drivers/parisc/ccio-dma.c?r1=1.12&r2=1.13> but that doesn't seems to fix the ccio-dma 
issue at all: I can still read those kind of message at the console while doing such copy
[snip]
scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
scsi1: Bus Reset detected, executing command 10953600, slot 109708a4, dsp 001301e8[01e8] 

  failing command because of reset, slot 10970778, cmnd 12644a00 

  failing command because of reset, slot 109708a4, cmnd 10953600 

scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN 

scsi1: Bus Reset detected, executing command 12644c40, slot 10970520, dsp 001301e8[01e8] 

  failing command because of reset, slot 10970520, cmnd 12644c40 

scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN 

scsi1: Bus Reset detected, executing command 109532a0, slot 1097064c, dsp 001301e8[01e8] 

  failing command because of reset, slot 1097064c, cmnd 109532a0 

end_request: I/O error, dev sdc, sector 197250
[snip]
while doing such copy:
root@hpalin:/boot# find . | cpio -mpduv /mnt/OldPA/boot/.
/mnt/OldPA/boot/././vmlinux-cp
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p2
/mnt/OldPA/boot/././vmlinux-cp13
/mnt/OldPA/boot/././vmlinux-2.6.23-c110
/mnt/OldPA/boot/././vmlinux-cp6
/mnt/OldPA/boot/././config-2.6.23-pa-b180
/mnt/OldPA/boot/././vmlinux-cp9
/mnt/OldPA/boot/././lost+found
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p4
/mnt/OldPA/boot/././vmlinux-2.6.22-3-parisc
/mnt/OldPA/boot/././config-2.6.23-c110-p15
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p5
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p15
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p10
/mnt/OldPA/boot/././System.map-2.6.22-3-parisc
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p13
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p6
/mnt/OldPA/boot/././config-2.6.22-3-parisc
/mnt/OldPA/boot/././vmlinux-cp14
/mnt/OldPA/boot/././initrd.img-2.6.22-3-parisc
/mnt/OldPA/boot/././vmlinux-2.4.17-32
/mnt/OldPA/boot/././vmlinux-cp11
/mnt/OldPA/boot/././vmlinux-cp10
/mnt/OldPA/boot/././vmlinux-cp5
/mnt/OldPA/boot/././vmlinux-cp15
/mnt/OldPA/boot/././System.map-2.4.17-32
/mnt/OldPA/boot/././config-2.6.23-c110-p2
/mnt/OldPA/boot/././vmlinux-2.6.23-pa-b180
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p14
/mnt/OldPA/boot/././vmlinux-cp4
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p
/mnt/OldPA/boot/././config-2.4.17-32
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p9
/mnt/OldPA/boot/././vmlinux
/mnt/OldPA/boot/././vmlinux-2.6.23-c110-p11
/mnt/OldPA/boot/././vmlinux-t
/mnt/OldPA/boot/././vmlinux-co
138420 blocks

(the scsi1 is the lasi scsi hba as sources and the target being the disks on ncr53c720 hba)

or experimenting fs issues on this target disks?


That said ok I will wait either U2/Uturn ers public doc or all volonteers feedback.

Cheers,
	r.
