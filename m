Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx09.cluster1.charter.net (dc-mx09.cluster1.charter.net [209.225.8.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6413A482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 16:41:04 -0600 (MDT)
Message-ID: <3D1A1BFF.7080000@charter.net>
Date: Wed, 26 Jun 2002 15:54:39 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: joel.soete@freebel.net, Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 24bit colour
References: <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2> <20020610203815.8349B380D5@carmen.fc.hp.com> <1024391159.3d0ef7f7c3903@webmail.tiscalinet.be> <20020618121104.E9435@parcelfarce.linux.theplanet.co.uk> <1025099026.3d19c51207773@webmail.tiscalinet.be> <20020626144536.B28662@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms060107090002030708000604"
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

This is a cryptographically signed message in MIME format.

--------------ms060107090002030708000604
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

The "Color Recovery" code supposedly dithers the colors in some
special way down to 8bpp and then the hardware somehow restores
them, right?



Matthew Wilcox wrote:
> On Wed, Jun 26, 2002 at 03:43:46PM +0200, joel.soete@freebel.net wrote:
> 
>>Quoting Matthew Wilcox <willy@debian.org>:
>>
>>>it's probably less work to teach XFree86 how to talk to your gfx card
>>>than it is to get the HPUX X server to run on Linux.
>>
>>I would prefer also but is there any documentation about this interface?
> 
> 
> i meant that it's probably less work to reverse-engineer the interface
> and implement it in XFree86 than it is to get the HPUX X server working.
> 



--------------ms060107090002030708000604
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJUDCC
AwYwggJvoAMCAQICAwe+nzANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUx
HTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVl
bWFpbCBSU0EgMjAwMC44LjMwMB4XDTAyMDYyMTE2MjAyNFoXDTAzMDYyMTE2MjAyNFowRjEf
MB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEjMCEGCSqGSIb3DQEJARYUYmRoaWx0
b25AY2hhcnRlci5uZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDOXnJuUCK8
cQL8lPdtre4RJrbTvLcJqZtNCb90rfkBsWybbcAJGWDJsYjsC/5ezfqkA92GeHHWtOzRk9JC
5I7WbvjlRyXdD8pYGn+OIqzO7//JaWTi5osnIu4A/ohLwafM8A2JqDemeIpWN7A22kUzYyxW
4/zP0rsuj5AEVvWkM9yTzKGChMKIemDR1SjFMPVcNIVkRbUqmGXRj6sTA5/f+0/iDVmg2aJ/
plkOMPJwJKRVnSitu32miuzJE0HEGgEcfJ3KVUhkiLTiRvH6ze227L8EvuSX+JL+GOrgU1ez
eyoJgkf/edOi4XgYvr2yizZk0r/KqTVzoOcqpXSNggRHAgMBAAGjMTAvMB8GA1UdEQQYMBaB
FGJkaGlsdG9uQGNoYXJ0ZXIubmV0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEA
q53hxPSUMk2rIVxPKU32fqJHubVDGqL15H70VOIP19PNun0tgkQIr5lQZoIm0v5McX/0jsUn
QocRX8O6zHmzhNJTHoOlcblE2pGkjk/utcs8XHizEGllawbsVohV87w2dOuIxVgSYqIH48jA
Kjpu8sMXF6a6QiHVUyFoReVi5mIwggMGMIICb6ADAgECAgMHvp8wDQYJKoZIhvcNAQEEBQAw
gZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUg
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
jFjShCfRPQAAAAAAAA==
--------------ms060107090002030708000604--
