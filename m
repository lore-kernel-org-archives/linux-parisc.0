Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA08342
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 13:37:31 -0700
Sender: Jes.Sorensen@cern.ch
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc and ptrace
References: <20001219182257.O7166@linuxcare.com> <d366kg5gi2.fsf@lxplus015.cern.ch> <20001219201446.B2554@linuxcare.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 19 Dec 2000 21:39:50 +0100
In-Reply-To: Richard Hirst's message of "Tue, 19 Dec 2000 20:14:46 +0000"
Message-ID: <d3snnk402x.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Richard" == Richard Hirst <rhirst@linuxcare.com> writes:

Richard> On Tue, Dec 19, 2000 at 08:59:49PM +0100, Jes Sorensen wrote:
>>  I'd say fix it in the kernel if it's cheaper to do so. You can
>> stick a wrapper in glibc as well, but it sounds to be simpler to do
>> in the kernel.

Richard> Kernel fix does seem more sensible, I just wonder if there is
Richard> a general move towards doing it one way rather than the
Richard> other.

I don't see a trend, a kernel fix allows us to inline the syscall
which is always nice.

Jes
