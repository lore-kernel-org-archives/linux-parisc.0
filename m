From: Joe Emenaker <joe@emenaker.com>
Subject: Re: [parisc-linux] Can't write to hard drives on a K200
Date: Tue, 26 Sep 2006 16:38:49 -0700
Message-ID: <4519BA09.5070000@emenaker.com>
References: <4518662C.6020103@emenaker.com> <45191956.4060800@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0555140148=="
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45191956.4060800@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--===============0555140148==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1;
	boundary="=_scully.cob.calpoly.edu-14092-1159314092-0001-2"

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_scully.cob.calpoly.edu-14092-1159314092-0001-2
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Joel Soete wrote:
>> Hrmmm.... so maybe the disks are read-only somehow, right? Well then 
>> how come I can dd like so:
>>
>>   dd if=/dev/zero of=/dev/sda bs=512 count=10
>>
>> That works fine. So.... anybody have any idea what's going on?
> If that doesn't matter to completely erase your disk try the same cmdl 
> without count param, i.e.
>     dd if=/dev/zero of=/dev/sda bs=512
Well, I did the entire drive with:
   dd if=/dev/zero of=/dev/sda bs=512 count=10 count=8388314
and that worked fine.

I also tried your
    dd if=/dev/zero of=/dev/sda bs=512k
and that worked too (8192 records in, 8192 records out).

So... dd works, (c)fdisk doesn't. I guess I could just get someone to 
partition a blank hd just the way I want and then send me their 
partition table (dd if=/dev/sdX bs=512 count=1 | gzip -9 | mail ....), 
then I could dd it on this end and I'd be all set, huh?

Well, there's another option. I could plug the drives into a SCSI card 
on a PC... but I've tried that, and I can't get that to work. If someone 
wants to help me with *that*, I'd appreciate that as well, since I 
clearly don't understand all of the intricacies of SCSI, because I 
couldn't get the PC to recognize the drive(s). I *think* it had to do 
with the drives being (apparently) "single-ended"... but I don't know.

- Joe

--=_scully.cob.calpoly.edu-14092-1159314092-0001-2
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJOTCC
AvcwggJgoAMCAQICEHKE5d1CKe8zTbgKdGEGRgUwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDQwNzAxMTI1MFoX
DTA3MDQwNzAxMTI1MFowXzERMA8GA1UEBBMIRW1lbmFrZXIxDzANBgNVBCoTBkpvc2VwaDEY
MBYGA1UEAxMPSm9zZXBoIEVtZW5ha2VyMR8wHQYJKoZIhvcNAQkBFhBqb2VAZW1lbmFrZXIu
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwxNyoeJ17aD/6pq7mkqe0BZF
c4K39d3cuPt567B/opDnQxnDQOX4mFW6P7gsemvZYqMozp7Sa3gfwxEWxTs7nAyvc3JSIpxq
GTwnh742VIMueoOj/SMeiPXKFICpiu0+TkZxUbJqHptZAJBJG3hSeoe5j1VqnJMuRACcaDeO
Xz8sZBxHEw5YBrKxCpGzgGDsKsk6rSxcu0Rf4bX7KanNirNdfUqEVP9rmXT3GvT3AxD9Q5BF
EqD2Y9E1IiS4YJVL8EUyP9bDftitFGJflm3cHqftPb+ujumxHG0AzaIzcFW9ELPr/flZhbet
9KUiKubH6AGaW4GTAwoh/I4F5XDLyQIDAQABoy0wKzAbBgNVHREEFDASgRBqb2VAZW1lbmFr
ZXIuY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAT6IcAjwZUWVbJZ1rLdsh
1GvQu1Yo9BLq6fSs/E3Ljm+HSc/VvqY1iuSJNbkyinDjxPWqkfFmwTSbVoBaXAQi1PHCfx5F
6//bd3b73gFJm6/BL5mQpb4pdEdrKGci1d7bw1n9ncr0S9h9yvAdEn0zTmspt/ormep2G7bI
e5EdgfEwggL3MIICYKADAgECAhByhOXdQinvM024CnRhBkYFMA0GCSqGSIb3DQEBBAUAMGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSww
KgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAeFw0wNjA0MDcw
MTEyNTBaFw0wNzA0MDcwMTEyNTBaMF8xETAPBgNVBAQTCEVtZW5ha2VyMQ8wDQYDVQQqEwZK
b3NlcGgxGDAWBgNVBAMTD0pvc2VwaCBFbWVuYWtlcjEfMB0GCSqGSIb3DQEJARYQam9lQGVt
ZW5ha2VyLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMMTcqHide2g/+qa
u5pKntAWRXOCt/Xd3Lj7eeuwf6KQ50MZw0Dl+JhVuj+4LHpr2WKjKM6e0mt4H8MRFsU7O5wM
r3NyUiKcahk8J4e+NlSDLnqDo/0jHoj1yhSAqYrtPk5GcVGyah6bWQCQSRt4UnqHuY9VapyT
LkQAnGg3jl8/LGQcRxMOWAaysQqRs4Bg7CrJOq0sXLtEX+G1+ympzYqzXX1KhFT/a5l09xr0
9wMQ/UOQRRKg9mPRNSIkuGCVS/BFMj/Ww37YrRRiX5Zt3B6n7T2/ro7psRxtAM2iM3BVvRCz
6/35WYW3rfSlIirmx+gBmluBkwMKIfyOBeVwy8kCAwEAAaMtMCswGwYDVR0RBBQwEoEQam9l
QGVtZW5ha2VyLmNvbTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAE+iHAI8GVFl
WyWday3bIdRr0LtWKPQS6un0rPxNy45vh0nP1b6mNYrkiTW5Mopw48T1qpHxZsE0m1aAWlwE
ItTxwn8eRev/23d2+94BSZuvwS+ZkKW+KXRHayhnItXe28NZ/Z3K9EvYfcrwHRJ9M05rKbf6
K5nqdhu2yHuRHYHxMIIDPzCCAqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UE
BhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYD
VQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNl
cyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJ
KoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAw
MFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25z
dWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJ
c3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1
BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J8CuFWqo/cVbLrzwL
B+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZ
cmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4oDagNIYy
aHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYD
VR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82
L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr3
94fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhByhOXdQinvM024
CnRhBkYFMAkGBSsOAwIaBQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTA2MDkyNjIzMzg0OVowIwYJKoZIhvcNAQkEMRYEFL32Q9TaOg2Y/AWUo3vJ
TsZMPuDoMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0G
CCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQcoTl3UIp
7zNNuAp0YQZGBTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQK
ExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29u
YWwgRnJlZW1haWwgSXNzdWluZyBDQQIQcoTl3UIp7zNNuAp0YQZGBTANBgkqhkiG9w0BAQEF
AASCAQAgY+RGKL9adwIZtdlIhP1N5bArz5n5wkCm5+NEEofiLuACJluNfAiTZDOEosDkhPmq
ie8UICdsYOrHD0TECuA6v3Xj5s5TyEv9sHXAVbroOWfmmOLPvmvg13btV1czHSAfwpxTc1uX
CfZXOTOmpi00AOEFaRCq8txT29lhYvF7hZ+X+4dFUDm2V5H+6+h0bXprZpwlqQkObrt/BCJm
iO7H93unaV8fD1XDbbn2v9RuZVtCS9vWA0vZvlIBCdeJ5YOkYQzCWxsDrfzFcHTMCxfpUxO6
W4cocsOLpBpUqbRU5cnxCVK+/YMDWCABsDG5B6kp7JjQOnNv2j7AtaJt7SWKAAAAAAAA
--=_scully.cob.calpoly.edu-14092-1159314092-0001-2--

--===============0555140148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0555140148==--
