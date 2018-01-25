From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date: Thu, 25 Jan 2018 08:01:31 -0500
Message-ID: <5A69D52B.90405@bell.net>
References: <11946948.1Lt8Nslq4k@devpool21>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <11946948.1Lt8Nslq4k@devpool21>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-01-25 3:59 AM, Rolf Eike Beer wrote:
> [  909.756303] Kernel panic - not syncing: Bad Address (null pointer deref?)
> [  909.756303] ---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)
>
> This is actually the second place where it breaks, before that I had the same
> with this test (twice):
Would you post the PIM dump of the most recent HPMC in the service 
menu?  Also needed
is the assembler dump of the routine where the HPMC occurred in your 
kernel.  You need the
64-bit version of objdump for this.

There's no info in the posted register dump about the panic other than 
it was probably generated
by the exception.

Dave

-- 
John David Anglin  dave.anglin@bell.net

