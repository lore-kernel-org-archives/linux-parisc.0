From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Some warning: ... cleanup; relay no interest?
Date: Sat, 28 Jul 2007 14:38:16 +0000
Message-ID: <46AB54D8.3090204__17432.9393114478$1416624419$gmane$org@scarlet.be>
References: <46A34724.1090108@scarlet.be> <200707232238.11288.deller@gmx.de> <200707232250.38148.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <soete.joel@scarlet.be>
In-Reply-To: <200707232250.38148.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

Helge Deller wrote:
> On Monday 23 July 2007, Helge Deller wrote:
>> Hi Joel,
>>
>> On Sunday 22 July 2007, Joel Soete wrote:
>>> There was <http://lists.parisc-linux.org/pipermail/parisc-linux/2007-June/031749.html>
>>>
>>> Really no interest, just missed or did I made a big mistake?
>> I don't like that patch very much.
>> It converts everything needlessly to (unsigned long long), which is 64bit long.
>>
>> Wouldn't it be better to use "%z" or "%z"<something> ?
>> %z refers to size_t which should be the native bit length.
> 
> Hi Joel,
> 
> e.g. replace "%lx" by "%Zx" or "%zx" ???
> (untested!!!)
> 
> Helge
> 
> 
I just do a short test again dino.c:

./drivers/parisc/dino.c
     898         if (request_resource(&ioport_resource, res) < 0) {
     899                 printk(KERN_ERR "%s: request I/O Port region failed "
     900                        "0x%Zx/%Zx (hpa 0x%p)\n",
     901                        name, res->start, res->end, dino_dev->hba.base_addr);
     902                 return 1;
     903         }

and unfortunately it doesn't help:
/CAD/linux-2.6.22-pa/drivers/parisc/dino.c: In function âdino_bridge_initâ:
/CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx expects type long unsigned int, but argument 4 has type 
resource_size_t
/CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx expects type long unsigned int, but argument 5 has type 
resource_size_t

same warning either Z or z qualifier :_(

As far as I understand of headers' comments:
./lib/vsprintf.c:
     270         int qualifier;          /* 'h', 'l', or 'L' for integer fields */
     271                                 /* 'z' support added 23/7/1999 S.H.    */
     272                                 /* 'z' changed to 'Z' --davidm 1/25/99 */
     273                                 /* 't' added for ptrdiff_t */

(so Z or z are all acceptable)

     472                 } else if (qualifier == 'Z' || qualifier == 'z') {
     473                         num = va_arg(args, size_t);

and all for the same type size_t

while here
./include/linux/ioport.h

      17 struct resource {
      18         resource_size_t start;
      19         resource_size_t end;
      20         const char *name;
      21         unsigned long flags;
      22         struct resource *parent, *sibling, *child;
      23 };

start & end are of type resource_size_t and not size_t.

I suppose that's why somewhere else upstream:
<http://www.linuxhq.com/kernel/v2.6/18/kernel/resource.c>

(still the same in 2.6.22.1), though.

Tx,
	Joel
