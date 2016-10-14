From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Board & CPU temperature of C8000 workstation with IPMI
Date: Fri, 14 Oct 2016 09:51:25 -0400
Message-ID: <75fb661f-ccbd-84ab-ad08-3df37d09b295@bell.net>
References: <xfk3dgbwtml2ipflw4qteta4.1476373659232@email.android.com>
 <CAL2AjcemWWonjOWNa+X+2Qsewfzohp0C4pFjh8CmAk2UbbC=-A@mail.gmail.com>
 <57FFB7C1.1040809@gmx.de> <5800DE0E.80809@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: pannonmage <pannonmage@googlemail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Helge Deller <deller@gmx.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5800DE0E.80809@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On 2016-10-14 9:30 AM, Helge Deller wrote:
> Additionally I wonder if it's possible to get more information filled in
> for IPMI on C8000 machines. E.g. is it possible on HP-UX to remotely turn
> the machine on and off ?
>
I had wondered that as well.  On rp3440, I see messages during boot that 
indicate that
the ipmi doesn't know how to do it.

I will try ipmitool on rp3440 tonight.

Dave

-- 
John David Anglin  dave.anglin@bell.net

