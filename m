Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id E777C4855
	for <parisc-linux@parisc-linux.org>; Sat, 13 Jul 2002 11:08:10 -0600 (MDT)
Message-ID: <3D305639.9060904@freebel.net>
Date: Sat, 13 Jul 2002 16:32:57 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] MD problem
References: <4E39457CA36BA347A9940A14D48B11A90AFE3B@umr-mail2.umr.edu>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello Nathan,


Neulinger, Nathan wrote:
> You got it in /etc/exports and running nfs?

No (but it should be a good idea)

Thanks,
	Joel

> 
> -- Nathan
> 
> ------------------------------------------------------------
> Nathan Neulinger                       EMail:  nneul@umr.edu
> University of Missouri - Rolla         Phone: (573) 341-4841
> Computing Services                       Fax: (573) 341-4216
> 
> 
> 
>>-----Original Message-----
>>From: joel.soete@freebel.net [mailto:joel.soete@freebel.net] 
>>Sent: Friday, July 12, 2002 1:05 PM
>>To: parisc-linux@parisc-linux.org
>>Subject: Re: [parisc-linux] MD problem
>>
>>
>>and additional problem:
>>if I mount automaticaly /boot in /etc/fstab it is impossible 
>>to dismount this fs:
>>
>>umount /boot
>>device busy
>>
>>fuser -u /boot
>>/boot
>>No process references; use -v for the complete list
>>fuser -v /boot:
>>
>>             USER       PID  ACCESS  COMMAND
>>/boot        root    kernel  mount   /boot
>>
>>Any idea? (if I mount it manualy after the reboot no problem?)
>>
>>Quoting joel.soete@freebel.net:
>>
>>
>>>Hi All,
>>>
>>>I build a raid-1 configuration starting from the internal disk sdb
>>>formated as
>>>follow:
>>>                                  cfdisk 2.11n
>>>
>>>                              Disk Drive: /dev/sdb
>>>                             Size: 9100044288 bytes
>>>              Heads: 64   Sectors per Track: 32   Cylinders: 8678
>>>
>>>    Name        Flags      Part Type  FS Type          
>>
>>[Label]       
>>
>>>Size (MB)
>>>
>>>
>>
>>--------------------------------------------------------------
>>----------------
>>
>>>    sdb1                    Primary   Linux/PA-RISC boot    
>>
>>            
>>
>>> 63.97
>>>    sdb2                    Primary   Linux swap            
>>
>>            
>>
>>>128.98
>>>    sdb3                    Primary   Linux                 
>>
>>            
>>
>>>127.93
>>>    sdb5                    Logical   Linux                 
>>
>>           
>>
>>>1664.10
>>>    sdb6                    Logical   Linux                 
>>
>>            
>>
>>>255.86
>>>    sdb7                    Logical   Linux                 
>>
>>            
>>
>>>127.93
>>>    sdb8                    Logical   Linux                 
>>
>>            
>>
>>>127.93
>>>    sdb9                    Logical   Linux                 
>>
>>           
>>
>>>2047.87
>>>    sdb10                   Logical   Linux                 
>>
>>           
>>
>>>2047.87
>>>    sdb11                   Logical   Linux                 
>>
>>           
>>
>>>2047.87
>>>                            Logical   Free Space            
>>
>>            
>>
>>>459.28
>>>
>>>sdb3 being the /boot & sdb5 / fs.
>>>
>>>then I copy this structure with sfdisk -d /dev/sdb | sfdisk /dev/sda
>>>(same size
>>>but not the same supplier) and synchronize all mdi with 
>>
>>respective disk
>>
>>>slice.
>>>
>>>All is ok. But still have to mirror manually quasi static 
>>
>>slices: sdx1
>>
>>>(F0) and
>>>sdx3 (/boot). So I umount /boot and made a dd from sdb3 to 
>>
>>sda3 Ok and
>>
>>>sdb1 to
>>>sda1 Ok.
>>>
>>>But when I try to boot from the mirror (ie sda) bootloader 
>>
>>did not find
>>
>>>the ipl
>>>eventhought the copy of the two F0 slices (I can still boot 
>>
>>from sdb)?
>>
>>>What do I wrong or better what should I have to resolve 
>>
>>this problem?
>>
>>>Thanks in advance for advice,
>>>    Joel
>>>
>>>
>>>-------------------------------------------------
>>>This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
>>>_______________________________________________
>>>parisc-linux mailing list
>>>parisc-linux@lists.parisc-linux.org
>>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>>
>>
>>
>>-------------------------------------------------
>>This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> 
