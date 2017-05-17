From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or reboot.
Date: Tue, 16 May 2017 20:47:09 -0400
Message-ID: <9F3482D3-C4C0-42F5-9675-857365865924@bell.net>
References: <20170512165513.GA23551@ls3530.fritz.box> <267CAD7B-3DB7-457E-8A82-2CFB2FF07587@bell.net> <eb437932-ad37-b6d4-0035-edcf76538424@gmx.de> <926005BA-0712-4D52-8995-E9FEDB5F890E@bell.net> <cdeeccf5-653f-2b99-5370-707b2862e46a@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <cdeeccf5-653f-2b99-5370-707b2862e46a@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-05-16, at 3:22 PM, Helge Deller wrote:

> On 16.05.2017 02:29, John David Anglin wrote:
>> On 2017-05-15, at 3:39 AM, Helge Deller wrote:
>> 
>>> Anyway, I did included an updated patch [1] in my last git pull request to Linus (which actually
>>> didn't made it into 4.12...).
>>> Can you test this one instead?
>> 
>> I still see same behavior.
>> (After the system prints the message that it is okay to power off, 
>> the front panel LED shows a flashing red, and pressing the power 
>> button once doesn't power the system down. Pressing it again 
>> causes the system to reboot.
> 
> I'll probably drop the patch then.
> I didn't noticed that myself because I turn off/on the machine
> via a remote power plug (via USB connected to a x86).

I did a new kernel build after reverting change and tried "shutdown -h +0":

reboot: Power down                                                              
System shut down completed.                                                     
Please power this system off now.                                               
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [halt:2906]               
Modules linked in: ext2 ipv6 sg ext4 crc16 jbd2 mbcache sd_mod ohci_pci pata_sid
CPU: 0 PID: 2906 Comm: halt Not tainted 4.10.16+ #1                             
task: 000000007e5a6b30 task.stack: 000000007f140000                             
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000001011001111111100001111 Not tainted                               
r00-03  000000ff082cff0f 00000000406cf700 0000000040170870 000000007f140360     
r04-07  00000000406a5700 000000004321fedc 0000000028121969 0000000000000000     
r08-11  fffffffffee1dead 0000000000000000 0000000000013318 0000000000000000     
r12-15  0000000000000001 0000000000000001 0000000000000001 0000000000000001     
r16-19  0000000000000001 0000000000000000 00000000fffffff6 0000000000000000     
r20-23  0000000000000001 00000000000001c1 0000000000000000 00000000408d37d5     
r24-27  0000000000000000 000000000800000f 0000000040835c60 00000000406a5700     
r28-31  000000004080a784 000000007f1403b0 000000007f1403e0 0000000000000002     
sr00-03  000000000063f000 0000000000000000 0000000000000000 000000000063f000    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040170874 0000000040170870 
 IIR: 00000000    ISR: 000000000000003d  IOR: 00000000408d3332                  
 CPU:        0   CR30: 000000007f140000 CR31: ffffffffffffffff                  
 ORIG_R28: 00000000401e9ce0                                                     
 IAOQ[0]: machine_power_off+0x8c/0x90                                           
 IAOQ[1]: machine_power_off+0x88/0x90                                           
 RP(r2): machine_power_off+0x88/0x90                                            
Backtrace:                                                                      

Can we kill NMI watch dog?

Dave
--
John David Anglin	dave.anglin@bell.net



