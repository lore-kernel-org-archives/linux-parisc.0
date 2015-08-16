From: Helge Deller <deller@gmx.de>
Subject: Re: bad address in handle_percpu_irq
Date: Sun, 16 Aug 2015 21:20:53 +0200
Message-ID: <55D0E295.2070000@gmx.de>
References: <55D0313E.3090602@gmail.com> <55D06863.1090506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Graham Gower <graham.gower@gmail.com>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55D06863.1090506@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Graham,

On 16.08.2015 12:39, Graham Gower wrote:
>> I'm seeing the panic below on a c8000. It happens sometimes when booting, just
>> before the login prompt is to appear. I've seen it with older kernels too, going
>> back to at least 3.19.

I have never seen such problems on the c8000...

>> [62.596000  <tel:62596000>] CPU: 0 PID: 444 Comm: (agetty) Not tainted 4.1.0-1-parisc64-smp #1 Debian 4.1.3-1

Do not use that kernel version, since it is missing at least this important patch:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4c4ac9a48ac512c6b5a6cca06cfad2ad96e8caaa
I'm seeing that the next debian kernel 4.1.5-1 (which should have this patch) is currently being built and should finish by tomorrow:
http://buildd.debian-ports.org/status/package.php?p=linux&suite=sid

Our C8000 debian buildd server is currently running this kernel since 23 days:
4.0.0-2-parisc64-smp #1 SMP Debian 4.0.8-2 (2015-07-23) parisc64 GNU/Linux
Maybe you wait until tomorrow or try this kernel in the meantime ?

Helge
