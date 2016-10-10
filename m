From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc crash on boot with 4.8+git
Date: Mon, 10 Oct 2016 19:26:30 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1610101925320.14896@math.ut.ee>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee> <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee> <57FA089F.1020301@gmx.de> <alpine.LRH.2.20.1610092356270.32571@math.ut.ee> <57FAA079.5010502@gmx.de>
 <alpine.LRH.2.20.1610100857110.32571@math.ut.ee> <57FBA9F1.6000009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57FBA9F1.6000009@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Memory Ranges:
> >  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
> >  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
> > Total Memory: 2046 MB
> 
> 2046 MB ???
> That's strange, it should be 2048 MB.
> 
> Can you check in your firmware "service" or "Configuration" menu, if it 
> reports some entries in your PDT (Page Deallocation Table) ?
> What happens if you clean the PDT entries (see firmware menu) and boot again?

Service Menu: Enter command > pdt

PAGE DEALLOCATION TABLE INFORMATION

   Location      Address       Type        Perm  Page  
   ------------  ------------  ----------  ----  ---------

   No Entries in Page Deallocation Table 

   PDT Entries Used: 0
   PDT Entries Free: 3000
   PDT Total Size:   3000

Seems it is not PDT?

-- 
Meelis Roos (mroos@linux.ee)
