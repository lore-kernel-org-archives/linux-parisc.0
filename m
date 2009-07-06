From: Randolph Chung <randolph@tausq.org>
Subject: Re: HPPA and Squeeze
Date: Mon, 06 Jul 2009 13:38:05 +0800
Message-ID: <4A518DBD.3090209@tausq.org>
References: <20090706014321.E91A45146@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	carlos@systemhalted.org, deller@gmx.de, kurt@roeckx.be,
	pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706014321.E91A45146@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


>>>>> I seem to recall that the kernel mmap implementation on hppa is somewhat
>>>>> unique.
>>>>>           
>>>> I don't recall anything, Kyle?
>>>>         
>>> This came up with respect to the GCC PCH implementation for parisc.  See
>>> comments in host-hpux.h.  At the moment, we do have a PCH related bug.
>>> See PR 39355.  While I know the problem is present in the PCH file, I
>>> haven't been able to figure out how wrong data gets in the file.
>>>       
There are some limitations on hppa if a file is both opened for reading 
(via read()) and written to via a mmap'ed mapping. This came up a few 
years ago.

Does gcc do this?

randolph
