From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Sun, 1 Oct 2017 10:47:12 -0400
Message-ID: <69FBACCA-6010-4FFA-A873-52B77439BD1C@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171001114626.GA16118@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-01, at 7:46 AM, Tom Bogendoerfer wrote:

>> I have a c8000 with hpux although I haven't booted it in some time.
>> Let me know specifically what is needed and I'll give it a try.
> 
> does it have a working graphics card ? 

We have in linux boot:

Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000                    
LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new                  
LBA 0:4: PCI host bridge to bus 0000:80                                         
pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0)
pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] )
pci_bus 0000:80: root bus resource [bus 80-87]                                  
powersw: Soft power switch at 0xfffffff0f042e278 enabled.                       
pci 0000:80:00.0: vgaarb: setting as boot VGA device                            
pci 0000:80:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=noe
pci 0000:80:00.0: vgaarb: bridge control possible                               
vgaarb: loaded                                                                  

Dave
--
John David Anglin	dave.anglin@bell.net



