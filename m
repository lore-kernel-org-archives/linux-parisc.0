From: Helge Deller <deller@gmx.de>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 23:09:47 +0200
Message-ID: <4A735D9B.30200@gmx.de>
References: <20090731190304.C7BF55161@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>, elendil@planet.nl,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731190304.C7BF55161@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/31/2009 09:03 PM, John David Anglin wrote:
>> Only 32-bit targets have the 14-bit signed immediate offset (0x3fff),
>> which becomes a 13-bit limit when loading positive offsets e.g.
>> +0x1fff or 1023 GOT slots.
>
> Can't we offset the table and double the number of entries?

Dave,
Can you explain this idea a little more?
Helge
