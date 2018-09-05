release:
	docker build --rm --no-cache  -f Dockerfile -t luizbranco/hlnr-test:${version} .
	docker push luizbranco/hlnr-test:${version}
	git tag ${version}
	git push origin ${version}
