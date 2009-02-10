From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Tue, 10 Feb 2009 10:24:38 +0800
Message-ID: <4990E566.3020500@tausq.org>
References: <20090210021101.2118F4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090210021101.2118F4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

My memory is fuzzy and I had to dig through the archives a bit, but I 
seem to recall that it used to be that -pg will not work WITHOUT 
-ffunction-sections on 32-bit, because the call to _mcount was done 
using b,l. Dave and I fixed this in gcc in 2003 though.

I did find another thread about this here: 
http://gcc.gnu.org/ml/gcc-help/2008-11/msg00128.html

The followup replies from Ian Taylor and Jeff Law concurs with what you 
said below, but it looks like nothing has been done (yet?)

randolph

John David Anglin wrote:
>> It will currently only work with 64bit kernels, because the gcc options -pg
>> and -ffunction-sections can't be enabled at the same time and -ffunction-sections
>> is still needed to be able to link 32bit kernels.
>>     
>
> I have done some testing.  As far as I can tell, -pg works with
> -ffunction-sections on hppa-unknown-linux-gnu and hppa64-hp-hpux11.
> hppa2.0w-hp-hpux11 doesn't support -ffunction-sections.  So, I think
> we should propose that the code that disables -ffunction-sections
> with -pg be removed.
>
> Dave
>   

