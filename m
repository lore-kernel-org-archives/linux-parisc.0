From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 14/22] parisc: %pF is only for function pointers
Date: Thu, 12 Mar 2015 10:43:51 -0400
Message-ID: <BLU437-SMTP4321320765AD407013D80497060@phx.gbl>
References: <1426130037-17956-1-git-send-email-scottwood@freescale.com>	 <1426130037-17956-14-git-send-email-scottwood@freescale.com> <1426162282.2146.77.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Scott Wood <scottwood@freescale.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1426162282.2146.77.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-03-12 8:11 AM, James Bottomley wrote:
> On Wed, 2015-03-11 at 22:13 -0500, Scott Wood wrote:
>> Use %pS for actual addresses, otherwise you'll get bad output
>> on arches like ppc64 where %pF expects a function descriptor.  Even on
>> other architectures, refrain from setting a bad example that people
>> copy.
> Are you sure about this?  Parisc64 is a function description
> architecture.  There may be a misunderstanding about what
> __builtin_return_address(0) is supposed to return, but I'm certain the
> person who added the code thought it returned a function pointer, which
> on parisc64 would be a descriptor.

__builtin_return_address(0) returns the return address in the calling procedure
ignoring import/export stubs.  There are no function descriptors for return addresses.
Thus, it can't return a function pointer.

There are no function descriptors in 32-bit parisc when the -mfast-indirect-calls
compiler option is used.

This option used to be used for 64-bit kernel builds but this broke when the
-mfast-indirect-calls was fixed for user space (gcl uses it).  I worked a bit
on trying to eliminate function descriptors from the 64-bit kernel for performance
but I don't have a working change.

Dave

-- 
John David Anglin  dave.anglin@bell.net

