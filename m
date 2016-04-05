From: John David Anglin <dave.anglin@bell.net>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Tue, 5 Apr 2016 16:18:00 -0400
Message-ID: <57041D78.2080704@bell.net>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
 <570409DA.1060508@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>, Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <570409DA.1060508@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-04-05 2:54 PM, Helge Deller wrote:
> +		case R_PARISC_PCREL32:
> +			val -= (uint32_t) loc;
> +			*loc = val;
> +			break;
PCREL32 for a 64-bit application is "symbol - PC - 8 + addend".

Dave

-- 
John David Anglin  dave.anglin@bell.net

