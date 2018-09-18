From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C11 atomics on parisc are broken on gcc-7 and gcc-8
Date: Tue, 18 Sep 2018 19:39:47 -0400
Message-ID: <4a220748-4089-d052-4ef3-0c9fef3fc7aa@bell.net>
References: <alpine.LRH.2.02.1809181805210.29259@file01.intranet.prod.int.rdu2.redhat.com>
 <1a7f70f6-1a33-6cce-1c21-e83f3b65982a@bell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------8BC972EF5294C8475BC42D98"
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org
To: Mikulas Patocka <mpatocka@redhat.com>, linux-parisc@vger.kernel.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <1a7f70f6-1a33-6cce-1c21-e83f3b65982a@bell.net>
Resent-Message-ID: <Gm2BGz1OzcP.A.RLB.XzYobB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/4a220748-4089-d052-4ef3-0c9fef3fc7aa@bell.net

This is a multi-part message in MIME format.
--------------8BC972EF5294C8475BC42D98
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2018-09-18 7:13 PM, John David Anglin wrote:
> You are correct.  The problem is my fault.  I changed gcc when it was 
> realized that PA 2.0
> executes loads and stores out of order.  I need to add back some code 
> that was there before.
Testing the attached change.

Dave

-- 
John David Anglin  dave.anglin@bell.net


--------------8BC972EF5294C8475BC42D98
Content-Type: text/plain; charset=UTF-8;
 name="atomic-rvt.d"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="atomic-rvt.d"

SW5kZXg6IGNvbmZpZy9wYS9wYS5tZAo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBjb25maWcvcGEvcGEu
bWQJKHJldmlzaW9uIDI2NDQxMykKKysrIGNvbmZpZy9wYS9wYS5tZAkod29ya2luZyBjb3B5
KQpAQCAtOTk2MCw2ICs5OTYwLDU4IEBACiAKIDs7IEltcGxlbWVudCBhdG9taWMgREltb2Rl
IGxvYWQgdXNpbmcgNjQtYml0IGZsb2F0aW5nIHBvaW50IGxvYWQuCiAKKyhkZWZpbmVfZXhw
YW5kICJhdG9taWNfc3RvcmVxaSIKKyAgWyhtYXRjaF9vcGVyYW5kOlFJIDAgIm1lbW9yeV9v
cGVyYW5kIikgICAgICAgICAgICAgICAgOzsgbWVtb3J5CisgICAobWF0Y2hfb3BlcmFuZDpR
SSAxICJyZWdpc3Rlcl9vcGVyYW5kIikgICAgICAgICAgICAgIDs7IHZhbCBvdXQKKyAgICht
YXRjaF9vcGVyYW5kOlNJIDIgImNvbnN0X2ludF9vcGVyYW5kIildICAgICAgICAgICAgOzsg
bW9kZWwKKyAgIiIKK3sKKyAgaWYgKFRBUkdFVF9TWU5DX0xJQkNBTEwpCisgICAgeworICAg
ICAgcnR4IG1lbSA9IG9wZXJhbmRzWzBdOworICAgICAgcnR4IHZhbCA9IG9wZXJhbmRzWzFd
OworICAgICAgaWYgKHBhX21heWJlX2VtaXRfY29tcGFyZV9hbmRfc3dhcF9leGNoYW5nZV9s
b29wIChOVUxMX1JUWCwgbWVtLCB2YWwpKQorCURPTkU7CisgICAgfQorICBGQUlMOworfSkK
KworOzsgSW1wbGVtZW50IGF0b21pYyBISW1vZGUgc3RvcmVzIHVzaW5nIGV4Y2hhbmdlLgor
CisoZGVmaW5lX2V4cGFuZCAiYXRvbWljX3N0b3JlaGkiCisgIFsobWF0Y2hfb3BlcmFuZDpI
SSAwICJtZW1vcnlfb3BlcmFuZCIpICAgICAgICAgICAgICAgIDs7IG1lbW9yeQorICAgKG1h
dGNoX29wZXJhbmQ6SEkgMSAicmVnaXN0ZXJfb3BlcmFuZCIpICAgICAgICAgICAgICA7OyB2
YWwgb3V0CisgICAobWF0Y2hfb3BlcmFuZDpTSSAyICJjb25zdF9pbnRfb3BlcmFuZCIpXSAg
ICAgICAgICAgIDs7IG1vZGVsCisgICIiCit7CisgIGlmIChUQVJHRVRfU1lOQ19MSUJDQUxM
KQorICAgIHsKKyAgICAgIHJ0eCBtZW0gPSBvcGVyYW5kc1swXTsKKyAgICAgIHJ0eCB2YWwg
PSBvcGVyYW5kc1sxXTsKKyAgICAgIGlmIChwYV9tYXliZV9lbWl0X2NvbXBhcmVfYW5kX3N3
YXBfZXhjaGFuZ2VfbG9vcCAoTlVMTF9SVFgsIG1lbSwgdmFsKSkKKwlET05FOworICAgIH0K
KyAgRkFJTDsKK30pCisKKzs7IEltcGxlbWVudCBhdG9taWMgU0ltb2RlIHN0b3JlIHVzaW5n
IGV4Y2hhbmdlLgorCisoZGVmaW5lX2V4cGFuZCAiYXRvbWljX3N0b3Jlc2kiCisgIFsobWF0
Y2hfb3BlcmFuZDpTSSAwICJtZW1vcnlfb3BlcmFuZCIpICAgICAgICAgICAgICAgIDs7IG1l
bW9yeQorICAgKG1hdGNoX29wZXJhbmQ6U0kgMSAicmVnaXN0ZXJfb3BlcmFuZCIpICAgICAg
ICAgICAgICA7OyB2YWwgb3V0CisgICAobWF0Y2hfb3BlcmFuZDpTSSAyICJjb25zdF9pbnRf
b3BlcmFuZCIpXSAgICAgICAgICAgIDs7IG1vZGVsCisgICIiCit7CisgIGlmIChUQVJHRVRf
U1lOQ19MSUJDQUxMKQorICAgIHsKKyAgICAgIHJ0eCBtZW0gPSBvcGVyYW5kc1swXTsKKyAg
ICAgIHJ0eCB2YWwgPSBvcGVyYW5kc1sxXTsKKyAgICAgIGlmIChwYV9tYXliZV9lbWl0X2Nv
bXBhcmVfYW5kX3N3YXBfZXhjaGFuZ2VfbG9vcCAoTlVMTF9SVFgsIG1lbSwgdmFsKSkKKwlE
T05FOworICAgIH0KKyAgRkFJTDsKK30pCisKIChkZWZpbmVfZXhwYW5kICJhdG9taWNfbG9h
ZGRpIgogICBbKG1hdGNoX29wZXJhbmQ6REkgMCAicmVnaXN0ZXJfb3BlcmFuZCIpICAgICAg
ICAgICAgICA7OyB2YWwgb3V0CiAgICAobWF0Y2hfb3BlcmFuZDpESSAxICJtZW1vcnlfb3Bl
cmFuZCIpICAgICAgICAgICAgICAgIDs7IG1lbW9yeQpAQCAtOTk5OSw2ICsxMDA1MSwxNCBA
QAogewogICBlbnVtIG1lbW1vZGVsIG1vZGVsOwogCisgIGlmIChUQVJHRVRfU1lOQ19MSUJD
QUxMKQorICAgIHsKKyAgICAgIHJ0eCBtZW0gPSBvcGVyYW5kc1swXTsKKyAgICAgIHJ0eCB2
YWwgPSBvcGVyYW5kc1sxXTsKKyAgICAgIGlmIChwYV9tYXliZV9lbWl0X2NvbXBhcmVfYW5k
X3N3YXBfZXhjaGFuZ2VfbG9vcCAoTlVMTF9SVFgsIG1lbSwgdmFsKSkKKwlET05FOworICAg
IH0KKwogICBpZiAoVEFSR0VUXzY0QklUIHx8IFRBUkdFVF9ESVNBQkxFX0ZQUkVHUyB8fCBU
QVJHRVRfU09GVF9GTE9BVCkKICAgICBGQUlMOwogCg==
--------------8BC972EF5294C8475BC42D98--
