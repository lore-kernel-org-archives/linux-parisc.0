From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Purge existing TLB entries in set_pte_at and
 ptep_set_wrprotect - take 2
Date: Wed, 16 Jan 2013 23:18:35 +0100
Message-ID: <50F7273B.6010906@gmx.de>
References: <BLU0-SMTP8691FD3EB8749D3303BA57972D0@phx.gbl> <1358240719.2752.6.camel@dabdike.int.hansenpartnership.com> <6320254.iVaF30vePD@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <6320254.iVaF30vePD@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Rolf,

On 01/16/2013 10:44 PM, Rolf Eike Beer wrote:
> James Bottomley wrote:
>> On Mon, 2013-01-14 at 19:45 -0500, John David Anglin wrote:
>>> Attached is new version of patch which no longer saves and restores
>>> %sr1.  Lightly tested with a GCC build
>>> and a build of Debian gtk+3.0 package.
>>
>> I can merge it with your previous changelog, but for ease of git users,
>> the accepted format is
> 
>> v2: Attached is new version of patch which no longer saves and
>> restores  %sr1.  Lightly tested with a GCC build and a build of
>> Debian gtk+3.0 package.
> 
> Do we want that to go back into stable kernels?

Short answer: Yes.

Long answer:
First we need those patches upstream - which is what did not happened yet.
Then I wanted to take a look what we can send to stable.

Helge
