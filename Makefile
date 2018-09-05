release:
	git tag ${version}
	git push origin ${version}
	docker build --rm --no-cache  -f Dockerfile -t cyberbrain/hlnr-test:${version} .
	docker push cyberbrain/hlnr-test:${version}
