From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval
 to compat_time.h
Date: Tue, 16 Jan 2018 10:34:33 -0500
Message-ID: <20180116103433.0a1356d3@gandalf.local.home>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: mark.rutland@arm.com, linux-mips@linux-mips.org, peterz@infradead.org,
 benh@kernel.crashing.org, heiko.carstens@de.ibm.com, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, y2038@lists.linaro.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, sebott@linux.vnet.ibm.com,
 jejb@parisc-linux.org, will.deacon@arm.com, borntraeger@de.ibm.com,
 mingo@redhat.com, oprofile-list@lists.sf.net, catalin.marinas@arm.com,
 rric@kernel.org, cmetcalf@mellanox.com, arnd@arndb.de,
 oberpar@linux.vnet.ibm.com, acme@kernel.org, jwi@linux.vnet.ibm.com,
 john.stultz@linaro.org, tglx@linutronix.de, ubraun@linux.vnet.ibm.com,
 gerald.schaefer@de.ibm.com, linux-parisc@vger.kernel.org,
 gregkh@linuxfoundation.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, hoeppner@linux.vnet.ibm.com, sth@linux.vnet.ibm.com
To: Deepa Dinamani <deepa.kernel@gmail.com>
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

T24gTW9uLCAxNSBKYW4gMjAxOCAxODoxODoxMCAtMDgwMApEZWVwYSBEaW5hbWFuaSA8ZGVlcGEu
a2VybmVsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9mdHJhY2UuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gaW5kZXggMDlh
ZDg4NTcyNzQ2Li5kYjI1YWExNWI3MDUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vZnRyYWNlLmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9mdHJhY2UuaAoKQWNrZWQt
Ynk6IFN0ZXZlbiBSb3N0ZWR0IChWTXdhcmUpIDxyb3N0ZWR0QGdvb2RtaXMub3JnPgoKLS0gU3Rl
dmUKCj4gQEAgLTQ5LDcgKzQ5LDcgQEAgaW50IGZ0cmFjZV9pbnQzX2hhbmRsZXIoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpOwo+ICAjaWYgIWRlZmluZWQoX19BU1NFTUJMWV9fKSAmJiAhZGVmaW5lZChD
T01QSUxFX09GRlNFVFMpCj4gIAo+ICAjaWYgZGVmaW5lZChDT05GSUdfRlRSQUNFX1NZU0NBTExT
KSAmJiBkZWZpbmVkKENPTkZJR19JQTMyX0VNVUxBVElPTikKPiAtI2luY2x1ZGUgPGFzbS9jb21w
YXQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NvbXBhdC5oPgo+ICAKPiAgLyoKPiAgICogQmVjYXVz
ZSBpYTMyIHN5c2NhbGxzIGRvIG5vdCBtYXAgdG8geDg2XzY0IHN5c2NhbGwgbnVtYmVycwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpZMjAzOCBtYWlsaW5n
IGxpc3QKWTIwMzhAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby95MjAzOAo=
