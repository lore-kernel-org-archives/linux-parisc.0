Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17D6E4884
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 09:35:45 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 19ibtX-000705-00
	for <parisc-linux@parisc-linux.org>; Fri, 01 Aug 2003 17:32:39 +0200
Date: Fri, 1 Aug 2003 17:35:43 +0200
Message-ID: <3F29178A000004CB@ocpmta7.freegates.net>
In-Reply-To: <3F29178A000004C6@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] backport bitops.h stuff
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3F29178A000004CB/mail.tiscali.be"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--========/3F29178A000004CB/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

 
Hi pa,

>Can somebody help me to ci inot 2.4 this patch which backport ffs() needed
>for new devmapper ;)

Again I forget to attach the patch file, sorry.

    Joel

PS: Now I have an ADSL connection at home, may be could I now ask an account
to ci those kind of armless stuff

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 



--========/3F29178A000004CB/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bitops.h-patch"

LS0tIGJpdG9wcy5oLm9yaWcJMjAwMy0wOC0wMSAxNToyNTowMi4wMDAwMDAwMDAgKzAyMDAKKysr
IGJpdG9wcy5oCTIwMDMtMDgtMDEgMTU6Mjc6MzguMDAwMDAwMDAwICswMjAwCkBAIC0yMDgsMTMg
KzIwOCwzNCBAQAogCiAjaWZkZWYgX19LRVJORUxfXwogCisvKioKKyAqIF9fZmZzIC0gZmluZCBm
aXJzdCBiaXQgaW4gd29yZC4KKyAqIEB3b3JkOiBUaGUgd29yZCB0byBzZWFyY2gKKyAqCisgKiBV
bmRlZmluZWQgaWYgbm8gYml0IGV4aXN0cywgc28gY29kZSBzaG91bGQgY2hlY2sgYWdhaW5zdCAw
IGZpcnN0LgorICovCitzdGF0aWMgX19pbmxpbmVfXyB1bnNpZ25lZCBsb25nIF9fZmZzKHVuc2ln
bmVkIGxvbmcgd29yZCkKK3sKKwl1bnNpZ25lZCBsb25nIHJlc3VsdCA9IDA7CisKKwl3aGlsZSAo
ISh3b3JkICYgMVVMKSkgeworCQlyZXN1bHQrKzsKKwkJd29yZCA+Pj0gMTsKKwl9CisJcmV0dXJu
IHJlc3VsdDsKK30KKwogLyoKICAqIGZmczogZmluZCBmaXJzdCBiaXQgc2V0LiBUaGlzIGlzIGRl
ZmluZWQgdGhlIHNhbWUgd2F5IGFzCiAgKiB0aGUgbGliYyBhbmQgY29tcGlsZXIgYnVpbHRpbiBm
ZnMgcm91dGluZXMsIHRoZXJlZm9yZQogICogZGlmZmVycyBpbiBzcGlyaXQgZnJvbSB0aGUgYWJv
dmUgZmZ6IChtYW4gZmZzKS4KICAqLwotCi0jZGVmaW5lIGZmcyh4KSBnZW5lcmljX2Zmcyh4KQor
c3RhdGljIF9faW5saW5lX18gaW50IGZmcyhpbnQgeCkKK3sKKwlpZiAoIXgpCisJCXJldHVybiAw
OworCXJldHVybiBfX2ZmcygodW5zaWduZWQgbG9uZyl4KTsKK30KIAogLyoKICAqIGh3ZWlnaHRO
OiByZXR1cm5zIHRoZSBoYW1taW5nIHdlaWdodCAoaS5lLiB0aGUgbnVtYmVyCg==

--========/3F29178A000004CB/mail.tiscali.be--
