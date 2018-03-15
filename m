From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Thu, 15 Mar 2018 16:48:23 -0400
Message-ID: <358e0185-b770-d961-a1f2-bbb9703f4d26@bell.net>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
Resent-Message-ID: <jLjRgZ68pRL.A.WeB.pwtqaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/358e0185-b770-d961-a1f2-bbb9703f4d26@bell.net

On 2018-03-15 4:43 PM, Helge Deller wrote:
> On 15.03.2018 16:36, Carlo Pisani wrote:
>> I am experiencing a very annoying behavior with my HPPA C3600: if I
>> compile the (linux) kernel with  -mlong-calls then the IO (e.g. file
>> copy) becomes very slow, and the PCI becomes unstable (i.e. it crashes
>> the machine)
>>
>> kernel  gcc     binutils    with mlong    without mlong
>> 4.15.7  4.9.3   2.25.1     13.4 MB/s    27.0 MB/s
>> 4.15.7  6.4.0   2.25.1     13.4 MB/s    27.0 MB/s
>> 4.15.7  6.4.0   2.29.1     14.4 MB/s    25.0 MB/s
> Interesting bad results!
I don't believe the instability mentioned is due to long calls. It's the 
following issue:
https://www.spinics.net/lists/linux-parisc/msg01024.html
