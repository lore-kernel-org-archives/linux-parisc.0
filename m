From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Aw: [PATCH v3] parisc: Change L1_CACHE_BYTES to 16
Date: Thu, 22 Oct 2015 10:53:28 -0400
Message-ID: <5628F868.3040105@bell.net>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net>
 <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
 <B8E85737-5ECD-4CBE-8730-886B098C5FA4@bell.net>
 <trinity-eda7d55d-7234-4b29-a15c-955f8ba0c95e-1445513884942@3capp-gmx-bs32>
 <trinity-8980ad10-b889-45cf-8f37-a33ba9cf99ef-1445514797080@3capp-gmx-bs32>
 <1445524549.2207.1.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1445524549.2207.1.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-10-22 10:35 AM, James Bottomley wrote:
> On Thu, 2015-10-22 at 13:53 +0200, Helge Deller wrote:
>>>> Betreff: [PATCH v3] parisc: Change L1_CACHE_BYTES to 16
>>>> The latest version changes L1_CACHE_BYTES to 16 bytes and doesn't =
adjust SMP_CACHE_BYTES as
>>>> per James suggestion
>>> This patch sadly breaks build on Linux kernel git head:
>>>
>>> In file included from /home/cvs/LINUX/git-kernel/linux-2.6/net/core=
/dev.c:92:0:
>>> /net/core/dev.c: In function =E2=80=98expand_xps_map=E2=80=99:
>>> /include/linux/netdevice.h:721:27: warning: overflow in implicit co=
nstant conversion [-Woverflow]
>>>   #define XPS_MIN_MAP_ALLOC ((L1_CACHE_BYTES - sizeof(struct xps_ma=
p)) \
>>> /net/core/dev.c:1972:18: note: in expansion of macro =E2=80=98XPS_M=
IN_MAP_ALLOC=E2=80=99
>>>    int alloc_len =3D XPS_MIN_MAP_ALLOC;
>> This is one possibility to fix it:
>>
>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>> index 2d15e38..21cf683 100644
>> --- a/include/linux/netdevice.h
>> +++ b/include/linux/netdevice.h
>> @@ -718,7 +718,7 @@ struct xps_map {
>>          u16 queues[0];
>>   };
>>   #define XPS_MAP_SIZE(_num) (sizeof(struct xps_map) + ((_num) * siz=
eof(u16)))
>> -#define XPS_MIN_MAP_ALLOC ((L1_CACHE_BYTES - sizeof(struct xps_map)=
)   \
>> +#define XPS_MIN_MAP_ALLOC ( (L1_CACHE_BYTES > sizeof(struct xps_map=
) ? L1_CACHE_BYTES : 2 * L1_CACHE_BYTES) - sizeof(struct xps_map)   \
>>       / sizeof(u16))
> But it indicates the whole kernel has the architectural assumption th=
at
> L1_CACHE_BYTES >=3D 32, so I don't think we should be trying to chang=
e
> that.
However, there are already at least two other arches with L1_CACHE_BYTE=
S=20
=3D 16.

Dave

--=20
John David Anglin  dave.anglin@bell.net

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
