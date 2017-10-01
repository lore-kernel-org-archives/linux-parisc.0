From: John David Anglin <dave.anglin@bell.net>
Subject: Re: AW: v4.14.0-rc1+
Date: Sun, 1 Oct 2017 10:58:52 -0400
Message-ID: <CC5D2FE5-B920-4AB4-9B0F-A098528C42D6@bell.net>
References: <lilfbtwi7r01tfe6wj0fccy0.1506609236089@email.android.com> <3546a20b-dbbc-6946-9390-72201e094923@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3546a20b-dbbc-6946-9390-72201e094923@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

rc2+ booted on c8000 (don't know about mx3210) but I saw the following error that I haven't seen before:

sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)
...
sd 4:0:0:0: [sda] Write Protect is off                                          
sd 4:0:2:0: [sdb] Spinning up disk...                                           
sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FA
...
sd 4:0:0:0: [sda] Attached SCSI disk                                            
...
Begin: Will now check root file system ... fsck from util-linux 2.29.2          
[/sbin/fsck.ext3 (1) -- /dev/sda4] fsck.ext3 -a -C0 /dev/sda4                   
ROOT: clean, 146966/4341760 files, 6241775/17343EXT4-fs (sda4): mounting ext3 fm
502 blocks                                                                      
done.                                                                           
EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)         
done.                                                                           
...
sd 4:0:0:0: Attached scsi generic sg0 type 0                                    
...
attempt to access beyond end of device                                          
unknown-block(8,0): rw=0, want=143374744, limit=143374738                       
attempt to access beyond end of device                                          
unknown-block(8,0): rw=0, want=143374744, limit=143374738                       
Buffer I/O error on dev sda4, logical block 17343502, async page read           

Doesn't happen with v4.13.4.

Dave    

On 2017-09-28, at 1:36 PM, Helge Deller wrote:

> Hi Dave,
> 
> Actually, I didn't fully read your error description...
> I fixed a bug before rc2, where the kernel bootloader was hanging after
> saying "Decompressing...".
> I didn't saw any issues with ttyS switch...
> 
> Helge
> On 28.09.2017 16:33, Helge Deller wrote:
>> Should be fixed in rc2
>> -------- Ursprüngliche Nachricht --------
>> Von: John David Anglin <dave.anglin@bell.net>
>> Datum: 28.09.17 15:49 (GMT+01:00)
>> An: Helge Deller <deller@gmx.de>
>> Betreff: v4.14.0-rc1+
>> I tried to boot a v4.14.0-rc1+ build that I did a couple of days ago.  I
>> think the last patch
>> was the parisc merge.  It dies after console switch to ttyS1.  I tried
>> to reset using the RS
>> command but the system locked up completely and I lost console access.
>> Had to pull power
>> plug to reset it.  v4.13.3 booted successfully.
>> Dave
>> -- 
>> John David Anglin  dave.anglin@bell.net
> 

--
John David Anglin	dave.anglin@bell.net



