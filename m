From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: mmap problem in localedef
Date: Tue, 11 Apr 2017 15:57:57 +0200
Message-ID: <6c7c6e7be105acd09fafdcdbcce4a08f@sf-tec.de>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
 <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net>
 <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
 <2241815.7QkIsKQeSs@daneel.sf-tec.de>
 <20170401191023.xpf32zopaecd7dzy@raspberrypi-3.musicnaut.iki.fi>
 <59CDF2DE-076C-4BC0-8381-CE31A2AA8F56@bell.net>
 <20170402191245.odedqsqcx2cp5xtt@raspberrypi-3.musicnaut.iki.fi>
 <9978E89C-A7D6-4ED2-9751-69CA148505E3@bell.net>
 <076425B0-DC96-4309-95D3-50E5941452A3@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Meelis Roos <mroos@linux.ee>,
        linux-parisc@vger.kernel.org, linux-parisc-owner@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <076425B0-DC96-4309-95D3-50E5941452A3@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 2017-04-11 14:01, schrieb John David Anglin:
> On 2017-04-05, at 7:03 PM, John David Anglin wrote:
> 
>> Attached is my latest patch for glibc trunk on hppa.  
>> sysdeps/hppa/fpu/libm-test-ulps is updated with new
>> ulps values.  sysdeps/hppa/dl-fptr.c b/sysdeps/hppa/dl-fptr.c is 
>> updated because define for ALIGN_UP
>> moved.
> 
> Latest patch set adds v3 version of pthread_cond_t patch and fixes
> nptl/tst-typesizes.

+	  char *new_guard = (char *) (((uintptr_t) pd - guardsize) & 
~pagesize_m1);
+	  char *old_guard = (char *) (((uintptr_t) pd - pd->guardsize) & 
~pagesize_m1);

Why cast this to char* at all? Just use the uintptr_t numbers for the 
compare.

Eike
