From: Helge Deller <deller@gmx.de>
Subject: Re: [PARISC][PATCH] Change cpu_data[] and cpu_devices[] to per_cpu
 variables
Date: Thu, 15 May 2008 22:22:43 +0200
Message-ID: <482C9B93.9010701@gmx.de>
References: <200805030002.11151.deller@gmx.de> <20080515135857.GH12850@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080515135857.GH12850@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> On Sat, May 03, 2008 at 12:02:10AM +0200, Helge Deller wrote:
>>  config NR_CPUS
>> -	int "Maximum number of CPUs (2-32)"
>> -	range 2 32
>> +	int "Maximum number of CPUs (2-255)"
>> +	range 2 255
>>  	depends on SMP
>>  	default "32"
>> +	help
>> +	  This allows you to specify the maximum number of CPUs which this
>> +	  kernel will support.  The maximum supported value is 255 and the
>> +	  minimum value which makes sense is 2.
>>  
> 
> Er. Why?

This is mostly copied over from x86 arch and I think it doesn't make 
anything worse...
Doesn't Superdomes support more than 32 CPUs ? (although I think 
superdome isn't supported yet, or is it?)

Helge
