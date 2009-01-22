From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 16:46:11 -0800
Message-ID: <4977C1D3.2010801@zytor.com>
References: <20090121224335.099C94F30@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Grant Grundler <grundler@parisc-linux.org>, arnd@arndb.de,
	davem@davemloft.net, jaswinder@kernel.org, mingo@elte.hu,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090121224335.099C94F30@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>> CONFIG_64BIT on parisc user space looks very wrong.
>> This shouldn't be exported to user space. Is that what you meant?
> 
> This does get exported to user space as applications sometimes need
> to know whether they are running under a 32 or 64-bit kernel.  See
> config.guess.  However, it certainly would be wrong to use this
> to make decisions about user space.
> 

CONFIG_* macros are not (or at least should not) be exported to 
userspace!  Userspace should not make compile-time decisions based on 
kernel configuration -- a runtime property!

	-hpa

