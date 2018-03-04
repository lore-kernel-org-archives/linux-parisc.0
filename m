From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval
 to compat_time.h
Date: Sun, 4 Mar 2018 21:45:54 +0100
Message-ID: <e417db45-d400-3513-3897-7aefa9889711@gmx.de>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: mark.rutland@arm.com, linux-mips@linux-mips.org, peterz@infradead.org,
 benh@kernel.crashing.org, heiko.carstens@de.ibm.com, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, y2038@lists.linaro.org, mpe@ellerman.id.au,
 ubraun@linux.vnet.ibm.com, x86@kernel.org, sebott@linux.vnet.ibm.com,
 jejb@parisc-linux.org, will.deacon@arm.com, borntraeger@de.ibm.com,
 mingo@redhat.com, oprofile-list@lists.sf.net, catalin.marinas@arm.com,
 rric@kernel.org, cmetcalf@mellanox.com, arnd@arndb.de,
 oberpar@linux.vnet.ibm.com, acme@kernel.org, jwi@linux.vnet.ibm.com,
 rostedt@goodmis.org, gerald.schaefer@de.ibm.com, linux-parisc@vger.kernel.org,
 gregkh@linuxfoundation.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, hoeppner@linux.vnet.ibm.com, sth@linux.vnet.ibm.com,
 schwidefsky@de.ibm.com, linuxppc-dev
To: Deepa Dinamani <deepa.kernel@gmail.com>, tglx@linutronix.de,
 john.stultz@linaro.org
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <20180116021818.24791-3-deepa.kernel@gmail.com>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
List-ID: <linux-parisc.vger.kernel.org>

T24gMTYuMDEuMjAxOCAwMzoxOCwgRGVlcGEgRGluYW1hbmkgd3JvdGU6Cj4gQWxsIHRoZSBjdXJy
ZW50IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIGZvciB0aGVzZQo+IGFyZSB0aGUgc2Ft
ZS4gUmVmYWN0b3IgdGhlc2UgY29tbW9uIGRlZmluZXMgdG8gYSBjb21tb24KPiBoZWFkZXIgZmls
ZS4KPiAKPiBUaGUgbmV3IGNvbW1vbiBsaW51eC9jb21wYXRfdGltZS5oIGlzIGFsc28gdXNlZnVs
IGFzIGl0Cj4gd2lsbCBldmVudHVhbGx5IGJlIHVzZWQgdG8gaG9sZCBhbGwgdGhlIGRlZmluZXMg
dGhhdAo+IGFyZSBuZWVkZWQgZm9yIGNvbXBhdCB0aW1lIHR5cGVzIHRoYXQgc3VwcG9ydCBub24g
eTIwMzgKPiBzYWZlIHR5cGVzLiBOZXcgYXJjaGl0ZWN0dXJlcyBuZWVkIG5vdCBoYXZlIHRvIGRl
ZmluZSB0aGVzZQo+IG5ldyB0eXBlcyBhcyB0aGV5IHdpbGwgb25seSB1c2UgbmV3IHkyMDM4IHNh
ZmUgc3lzY2FsbHMuCj4gVGhpcyBmaWxlIGNhbiBiZSBkZWxldGVkIGFmdGVyIHkyMDM4IHdoZW4g
d2Ugc3RvcCBzdXBwb3J0aW5nCj4gbm9uIHkyMDM4IHNhZmUgc3lzY2FsbHMuCgpGb3IgcGFyaXNj
OgoKQWNrZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4gIyBwYXJpc2MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWTIwMzggbWFpbGluZyBs
aXN0ClkyMDM4QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8veTIwMzgK
