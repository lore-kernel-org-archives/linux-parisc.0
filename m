From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Thu, 15 Mar 2018 16:51:56 -0400
Message-ID: <113ad157-e8c3-81dc-5752-75416c8ce531@bell.net>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
Resent-Message-ID: <LhbufKbpScC.A.w9B.8ztqaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/113ad157-e8c3-81dc-5752-75416c8ce531@bell.net

On 2018-03-15 4:43 PM, Helge Deller wrote:
>> kernel  gcc     binutils    with mlong    without mlong
>> 4.15.7  4.9.3   2.25.1     13.4 MB/s    27.0 MB/s
>> 4.15.7  6.4.0   2.25.1     13.4 MB/s    27.0 MB/s
>> 4.15.7  6.4.0   2.29.1     14.4 MB/s    25.0 MB/s
> Interesting bad results!
>   
It's hard to understand why the performance would deteriorate so much 
but I see essentially
the same behavior.

Dave
