From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Wed, 22 Apr 2009 23:13:12 +0200
Message-ID: <49EF8868.4050308@gmx.de>
References: <49E6638B.8090700@gmx.de> <20090416063735.GA21742@liondog.tnic> <49E7945E.7030508@gmx.de> <20090417065344.GC6806@liondog.tnic> <49E82C8F.5060202@gmx.de> <20090422061253.GB22451@liondog.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: petkovbb@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090422061253.GB22451@liondog.tnic>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Borislav Petkov wrote:
> On Fri, Apr 17, 2009 at 09:15:27AM +0200, Helge Deller wrote:
> [..]
>>>> BTW, even with my patch ATAPI CDROM accesses don't work with the current kernel...
>>> What do you mean by that, please elaborate?
>> I meant:
>> a) Without my patch the kernel did crash (see backtrace in original mail)
>> b) with my patch the kernel booted to login prompt, but I got those messages on the console:
>>  hda: command error: status=0x51 { DriveReady SeekComplete Error }
>>  hda: command error: error=0x54 <3>{ AbortedCommand LastFailedSense=0x05 }
>>  ide: failed opcode was: unknown
>> Nevertheless, mounting a cdrom in the drive didn't suceeded with same/similiar messages, but
>> this could even be because of the parisc superio driver...
> 
> Is it possible to isolate it and test without the superio driver?

No, since the superio controller provides the IDE ports.

Best regards,
Helge
