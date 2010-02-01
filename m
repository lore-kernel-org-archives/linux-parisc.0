From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Mon, 01 Feb 2010 20:02:02 +0100
Message-ID: <4B67252A.2000501@gmx.de>
References: <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02/01/2010 01:26 AM, John David Anglin wrote:
>>>> Actually I did tested this with the minifail test program, and changed
>>>> thread_run() to call _exit(0) at the end instead of "return 0":
>>>> void* thread_run(void* arg) {
>>>>          ...
>>>> /*      return (void *)&status;  */
>>>>          _exit(0);
>>>> }
>>>> With strace I then suddenly got exit_group() which seems more correct:
>>>> [pid  1910] write(1, "Thread OK.\n", 11) = 11
>>>> [pid  1910] exit_group(0)               = ?
>
> Did this fix minifail?

No, sadly it didn't fixed it.

Helge
