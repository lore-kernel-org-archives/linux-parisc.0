From: Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v3 0/7]  Remove errors building drivers/DRIVERNAME
Date: Mon, 1 Oct 2018 09:56:07 +0200
Message-ID: <20181001075607.GA3776@rric.localdomain>
References: <20180928020816.11251-1-leobras.c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: lkcamp@lists.libreplanetbr.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        oprofile-list@lists.sf.net, linux-parisc@vger.kernel.org,
        linux-s390@vger.kernel.org
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928020816.11251-1-leobras.c@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27.09.18 23:08:09, Leonardo Brás wrote:
> This Patchset changes some driver's Makefile to allow them building
> using the command 'make drivers/DRIVERNAME', if compatible.
> 
> The changed drivers would return error if the above command was run
> on them, after an x86 allyesconfig.

I don't see what you are trying to achieve here. Why shouldn't the
command fail if it is not the intended way to call it? There are a
couple of use cases where drivers/ is used to share common code over
different archs and it is not always the intention to build them in
drivers/ directly.

> 
> The main reason of this patchset is to allow building lists of
> drivers looking for warnings and errors to be fixed.

If a list is the intention here, aren't there other ways to create it
other than using drivers/*?

-Robert

> 
> I see this change as a new feature, not a bugfix. I understand
> the default bahavior may be building with a simple 'make', but I
> believe adding this new possibility will not be harmful.
> 
> My main objective is to allow developers with low processing power
> to do changes in the kernel and look bugs using free services like
> GiltabCI, before submitting to community.
> 
> If there is any interest helping/using this, I have a prototype in:
> https://gitlab.com/LeoBras/linux-next
