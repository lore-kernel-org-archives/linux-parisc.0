From: Randolph Chung <randolph@tausq.org>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 07 Jul 2009 11:07:14 +0800
Message-ID: <4A52BBE2.7020507@tausq.org>
References: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> I started looking into why CONFIG_BACKTRACE_SELF_TEST=y shows uncomplete/wrong/broken backtraces.
>>
>> To me it seems, that the unwind tables are broken when using newer gcc/binutils versions.
> 
> Just wondering, but would it be possible to switch to using dwarf2 unwind
> information.  I presume that's what most other targets use.

the hppa kernel unwinder is derived from the ia64 unwinder, which is not 
dwarf2 based.

The only dwarf references I find in the kernel are some dwarf markups in 
signal frames to help userspace with signal frame unwinding. Have I 
missed anything?

x86 seems to do something very ad-hoc.

randolph
